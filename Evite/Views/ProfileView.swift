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
                            ProfileSegmentedControllerIOS14(selected: self.$segmentedControl)
                        } else {
                            ProfileSegmentedController(selected: self.$segmentedControl)
                        }
                        
                        Divider()
                        
                        if segmentedControl == 0 {
                            CalendarView()
                        } else {
                            Text("Upcoming cards")
                        }
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
                    .foregroundColor(.black)
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
