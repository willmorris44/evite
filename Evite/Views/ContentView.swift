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
                    Image(systemName: "house.fill")
            }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
            }
            
            CreateEventView()
                .tabItem {
                    Image(systemName: "plus.circle")
            }
            
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
            }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
