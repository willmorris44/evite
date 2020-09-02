//
//  ContentView.swift
//  Evite
//
//  Created by Will morris on 8/25/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainFeedView()
                .tabItem {
                    Icons.houseFill.image
            }
            
            SearchView()
                .tabItem {
                    Icons.magnifyingGlass.image
            }
            
            CreateEventView()
                .tabItem {
                    Icons.plusCircle.image
            }
            
            NotificationsView()
                .tabItem {
                    Icons.bell.image
            }
            
            ProfileView()
                .tabItem {
                    Icons.person.image
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
