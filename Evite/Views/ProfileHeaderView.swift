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
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .clipped()
            
            Text("@becky_123")
                .fontWeight(.semibold)
                
                HStack(spacing: 20) {
                    VStack {
                        Text("200")
                            .fontWeight(.semibold)
                        Text("Following")
                            .fontWeight(.light)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .frame(width: 75)
                    
                    Divider()
                        .frame(maxHeight: 25)
                    
                    VStack {
                        Text("300")
                            .fontWeight(.semibold)
                        Text("Followers")
                            .fontWeight(.light)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .frame(width: 75)
                    .layoutPriority(1)
                    
                    Divider()
                        .frame(maxHeight: 25)
                    
                    VStack {
                        Text("500")
                            .fontWeight(.semibold)
                        Text("Points")
                            .fontWeight(.light)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .frame(width: 75)
                }
            
            HStack {
                Button(action: {
                    //follow
                }, label: {
                    Text("Follow")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 150)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.purple)
                        .cornerRadius(2)
                    
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.down")
                })
                .buttonStyle(ProfileButtonStyle())
            }
            
            Text("Follow me on Instagram for a surprise!")
                .font(.callout)
                .fontWeight(.light)
                .padding(.top)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
