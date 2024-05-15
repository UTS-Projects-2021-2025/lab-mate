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
        channel = await supabase.channel(classroom.code)
        await channel?.subscribe()
        
        print("Joining Channel")
        
        do {
            let profile = try await fetchProfile()
            let presence = PresenceState(
                username: profile.username ?? "anonymous",
                fullName: profile.fullName ?? "Anonymous User"
            )
            
            try await channel?.track(presence)
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
