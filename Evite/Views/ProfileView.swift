//
//  ProfileView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        ProfileHeaderView()
                            .padding()
                        
                        Divider()
                        
                        CalendarView()
                    }
                }
            }
            .navigationBarTitle("Becky", displayMode: .inline)
//            IOS 14
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    HStack {
//                        Image(systemName: "sun.min.fill")
//                        Text("Title")
//                            .font(.headline)
//                            .foregroundColor(.orange)
//                    }
//                }
//            }
            //.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
