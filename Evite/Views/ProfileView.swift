//
//  ProfileView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettings = false
    @State private var segmentedControl = 0
    
    init() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .primary
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        ProfileHeaderView()
                            .padding()
                        
                        Divider()
                        
                        if #available(iOS 14.0, *) {
                            ProfileSegmentedController(selected: self.$segmentedControl)
                        } else {
                            // Fallback on earlier versions
                        }
                        
                        Divider()
                        
                        CalendarView()
                    }
                }
                NavigationLink(destination: Text("Settings"), isActive: $showSettings) {
                    EmptyView()
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.showSettings = true
            }, label: {
                Icons.elipses.image
                    .frame(width: 50, height: 30)
            }))
            .navigationBarTitle("Becky", displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
