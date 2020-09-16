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
            Image("profile_pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 125, maxHeight: 125)
                .clipShape(Circle())
                .clipped()
            
            Text("@becky_123")
                .fontWeight(.ultraLight)
            
            HStack(spacing: 30) {
                VStack {
                    Text("200")
                        .fontWeight(.semibold)
                    Text("Following")
                        .fontWeight(.light)
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("300")
                        .fontWeight(.semibold)
                    Text("Followers")
                        .fontWeight(.light)
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("500")
                        .fontWeight(.semibold)
                    Text("Points")
                        .fontWeight(.light)
                        .font(.callout)
                        .foregroundColor(.gray)
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
