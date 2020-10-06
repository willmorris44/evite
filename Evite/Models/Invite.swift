//
//  Invite.swift
//  Evite
//
//  Created by Brian Hersh on 8/25/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

struct Invite: Codable {
    
    enum State: String, Codable {
        case past
        case ongoing
        case future
    }
    
    let uuid: UUID
    let host: User
    let title: String
    let date: DateInterval
    var rewardPoints: Int
    var address: String
    var mutuals: [User]
    var atendees: [User]
    var dateCreated: Date
    var isPrivate: Bool
    var state: State
}
