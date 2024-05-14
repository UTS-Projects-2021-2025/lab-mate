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
    
    func joinClass() async {
        channel = await supabase.channel(classroom.code)
        await channel?.subscribe()
        
        print("Joining Channel")
        try? await channel?.track(PresenceState(username: "emendoza", fullName: "Euan Mendoza"))
    }
    
    func leaveClass() async {
        if let appChannel = channel {
            await supabase.removeChannel(appChannel)
        }
    }
}
