//
//  InviteViewModel.swift
//  Evite
//
//  Created by Will morris on 10/6/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation
import SwiftUI

class InvitesViewModel: ObservableObject {
    @Published var myInvites = [Invite]()
    @Published var pendingInvites = [Invite]()
    @Published var forYouInvites = [Invite]()
}
