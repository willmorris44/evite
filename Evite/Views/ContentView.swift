//
//  ContentView.swift
//  Evite
//
//  Created by Will morris on 8/25/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .primary
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = .primary
        UINavigationBar.appearance().compactAppearance = navAppearance
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
    }

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
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
