//
//  SettingsRowView.swift
//  Evite
//
//  Created by Will morris on 9/21/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct SettingsRowView: View {
    @State private var showPage = false
    
    var title: String
    
//    init(_ title: String) {
//        self.title = title
//    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.footnote)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
            
            NavigationLink(destination: Text(title), isActive: $showPage) {
                EmptyView()
            }
        }
        .background(Color.primary)
        .padding()
        .onTapGesture(perform: {
            self.showPage = true
        })
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(title: "Manage account")
    }
}
