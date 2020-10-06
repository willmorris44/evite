//
//  User.swift
//  Evite
//
//  Created by Brian Hersh on 8/25/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: String
    let displayName: String
    let email: String?
    let phone: String?
    var createdInvites: [Invite]
    var acceptedInvite: [Invite]
    var pendingInvites: [Invite]
    var declinedInvites: [Invite]
    var followers: [User]
    var following: [User]
    var points: Int
}
