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
    let owner: User
    let title: String
    let date: DateInterval
    let rewardPoints: Int
    let address: String
    let mutuals: [User]
    let atendees: [User]
    let dateCreated: Date
    let isPrivate: Bool
    let state: State
}
