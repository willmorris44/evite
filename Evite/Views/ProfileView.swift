//
//  ProfileView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

//extension HorizontalAlignment {
//    private enum MyHAlignment: AlignmentID {
//        static func defaultValue(in d: ViewDimensions) -> CGFloat {
//            return d[HorizontalAlignment.center]
//        }
//    }
//
//    static let myhAlignment = HorizontalAlignment(MyHAlignment.self)
//}

struct ProfileView: View {
    @State private var showSettings = false
    @State private var segmentedControl = 0

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
                        
//                        HStack {
//                            CalendarView()
//                            
//                            Text("LL")
//                        }
                        
                        if segmentedControl == 0 {
                            CalendarView()
                        } else {
                            Text("Upcoming cards")
                        }
                    }
                }
                NavigationLink(destination: SettingsView(), isActive: $showSettings) {
                    EmptyView()
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.showSettings = true
            }, label: {
                Icons.elipses.image
                    .font(.headline)
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
