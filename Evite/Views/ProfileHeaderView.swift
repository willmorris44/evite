//
//  ProfileHeaderView.swift
//  Evite
//
//  Created by Will morris on 9/13/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "person.circle")
                .font(.largeTitle)
            
            Text("@user")
                .fontWeight(.light)
            
            HStack(spacing: 30) {
                VStack {
                    Text("200")
                        .fontWeight(.semibold)
                    Text("following")
                        .fontWeight(.light)
                        .font(.callout)
                }
                
                VStack {
                    Text("300")
                        .fontWeight(.semibold)
                    Text("followers")
                        .fontWeight(.light)
                        .font(.callout)
                }
                
                VStack {
                    Text("500")
                        .fontWeight(.semibold)
                    Text("points")
                        .fontWeight(.light)
                        .font(.callout)
                }
            }
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
