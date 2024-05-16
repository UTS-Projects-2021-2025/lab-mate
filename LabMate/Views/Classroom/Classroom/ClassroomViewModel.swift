//
//  ClassroomViewModel.swift
//  LabMate
//
//  Created by Euan Mendoza on 13/5/2024.
//

import Foundation
import Supabase

@Observable
class ClassroomViewModel {
    let classroom: Classroom
    
    var channel: RealtimeChannelV2?
    var activities: [Activity] = []
    
    var isLoading = false
    
    var hasCurrentActivity = false
    
    init(classroom: Classroom) {
        self.classroom = classroom
    }
    
    func setup() {
        Task {
            await joinClass()
        }
    }
    
    func destroy() {
        Task {
            await leaveClass()
        }
    }
    
    func getCurrentActivity() -> Activity? {
        let now = Date()
        let currentActivities = activities.filter { $0.startTime < now && $0.endTime < now }
        return currentActivities.first
    }
    
    func fetchActivities() async {
        do {
            isLoading = true
            defer { isLoading = false }
            
            let dateInterval = Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
            
            activities = try await supabase
                .from("activities")
                .select("id,created_at,name,description,start_time,end_time")
                .eq("classroom_id", value: classroom.id)
                .gt("created_at", value: dateInterval.ISO8601Format())
                .order("start_time")
                .execute()
                .value
            
            activities.forEach { activity in
                let now = Date()
                if activity.startTime < now && activity.endTime > now {
                    hasCurrentActivity = true
                    return
                }
            }
            
            print("Activities:")
            print(activities)
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchProfile() async throws -> Profile {
        let user = try await supabase.auth.session.user
            
        return try await supabase
            .from("profiles")
            .select()
            .eq("id", value: user.id)
            .single()
            .execute()
            .value
    }
    
    func joinClass() async {
        await fetchActivities()
        
        channel = await supabase.channel(classroom.code)
       
        let insertions = await channel?.postgresChange(InsertAction.self, schema: "public", table: "activities")
        await channel?.subscribe()
        
        print("Joining Channel")
        
        do {
            let profile = try await fetchProfile()
            let presence = PresenceState(
                username: profile.username ?? "anonymous",
                fullName: profile.fullName ?? "Anonymous User"
            )
            
            try await channel?.track(presence)
            
            if let inserts = insertions {
                for await _ in inserts {
                    await fetchActivities()
                }
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func leaveClass() async {
        if let appChannel = channel {
            await supabase.removeChannel(appChannel)
        }
    }
}
