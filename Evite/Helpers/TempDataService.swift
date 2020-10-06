//
//  TempDataService.swift
//  Evite
//
//  Created by Will morris on 10/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation

class TempDataService {
    static var shared = TempDataService()
    
    var will = User(id: "@will_morris", displayName: "Will Morris", email: "will.morris@gmail.com", phone: "801-555-5555", createdInvites: [], acceptedInvite: [], pendingInvites: [], declinedInvites: [], followers: [], following: [], points: 2000)
    
    var brian = User(id: "@brianHersh2", displayName: "Brian", email: "brian.hersh@gmail.com", phone: "932-334-3234", createdInvites: [], acceptedInvite: [], pendingInvites: [], declinedInvites: [], followers: [], following: [], points: 100)
    
    var anne = User(id: "@annexo", displayName: "Annnneeee", email: nil, phone: nil, createdInvites: [], acceptedInvite: [], pendingInvites: [], declinedInvites: [], followers: [], following: [], points: 250)
    
    var john = User(id: "@john", displayName: "John Guy", email: nil, phone: nil, createdInvites: [], acceptedInvite: [], pendingInvites: [], declinedInvites: [], followers: [], following: [], points: 600)
    
    var rick = User(id: "@rickthestick", displayName: "Rick Whitmore", email: nil, phone: nil, createdInvites: [], acceptedInvite: [], pendingInvites: [], declinedInvites: [], followers: [], following: [], points: 200)
    
    //####################################################//
    
    init() {
        setupData()
        setupInvites()
    }
    
    func setupData() {
        will.followers.append(brian)
        will.followers.append(anne)
        will.followers.append(john)
        will.followers.append(rick)
        
        brian.followers.append(will)
        brian.followers.append(anne)
        brian.followers.append(john)
        brian.followers.append(rick)
        
        anne.followers.append(john)
        anne.followers.append(rick)
        
        john.followers.append(rick)
        
        //##########################//
        
        rick.following.append(john)
        rick.following.append(anne)
        rick.following.append(brian)
        rick.following.append(will)
        
        john.following.append(anne)
        john.following.append(brian)
        john.following.append(will)
        
        anne.following.append(brian)
        anne.following.append(will)
        
        brian.following.append(will)
        
        will.following.append(brian)
    }
    
    func setupInvites() {
        let brianInvite = Invite(uuid: UUID(), host: brian, title: "Nacho's Birthday", date: DateInterval(start: Date(), end: Date().addingTimeInterval(500)), rewardPoints: 50, address: "Skyhouse", mutuals: [], atendees: [], dateCreated: Date(), isPrivate: true, state: .future)
        
        let anneInvite = Invite(uuid: UUID(), host: anne, title: "Work party", date: DateInterval(start: Date(), duration: 500), rewardPoints: 45, address: "Optimist Hall", mutuals: [], atendees: [], dateCreated: Date(), isPrivate: true, state: .future)
        
        let johnInvite = Invite(uuid: UUID(), host: john, title: "Bar Crawl", date: DateInterval(start: Date(), duration: 40000), rewardPoints: 150, address: "Downtown charlotte", mutuals: [], atendees: [], dateCreated: Date().addingTimeInterval(-939), isPrivate: false, state: .ongoing)
        
        let rickInvite = Invite(uuid: UUID(), host: rick, title: "Park Party", date: DateInterval(start: Date(), duration: 50505), rewardPoints: 290, address: "Fourth Ward park", mutuals: [], atendees: [], dateCreated: Date(), isPrivate: false, state: .future)
        
        //####################################################//
        
        will.pendingInvites.append(anneInvite)
        will.acceptedInvite.append(brianInvite)
        will.acceptedInvite.append(johnInvite)
        will.acceptedInvite.append(rickInvite)
        
        brian.createdInvites.append(brianInvite)
        brian.acceptedInvite.append(anneInvite)
        
    }
}
