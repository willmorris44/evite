//
//  NotificationsView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct NotificationsView: View {
    
    init() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .primary
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach((0..<10)) { i in
                        NotificationView()
                            .padding(.top)
                    }
                }
            }
            .navigationBarTitle("Notifications", displayMode: .inline)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
