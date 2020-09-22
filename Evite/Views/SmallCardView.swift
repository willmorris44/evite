//
//  SmallCardView.swift
//  Evite
//
//  Created by Will morris on 8/31/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct SmallCardView: View {
    @State private var isShow: Bool = false
    
    init(){
        print("init")
    }
    
    var body: some View {
        VStack {
            Text("MGM Grand Party")
                .fontWeight(.bold)
                .font(.headline)
                .lineLimit(1)
                .padding(.top)
            
            Text("25 Points")
                .fontWeight(.light)
                .font(.subheadline)
            
            HStack {
                Image("profile_pic_2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 30, maxHeight: 30)
                    .clipShape(Circle())
                    .clipped()
                
                Image("profile_pic_3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 30, maxHeight: 30)
                    .clipShape(Circle())
                    .clipped()
                    .padding(.leading, -20)
                
                Image("profile_pic_4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 30, maxHeight: 30)
                    .clipShape(Circle())
                    .clipped()
                    .padding(.leading, -20)
                
                Text("+ 3")
                    .fontWeight(.light)
                    .font(.subheadline)
                    .lineLimit(1)
                    .layoutPriority(1)
            }
            .padding(.vertical)
            
            NavigationLink(destination: Text("hll"), isActive: $isShow) {
                EmptyView()
            }
            Button(action: {
                self.isShow = true
            }) {
                Text("Info")
                    .fontWeight(.semibold)
                    .padding(.vertical, 5)
                    .frame(width: 100)
                    .foregroundColor(.primary)
                    .background(Color(.secondary))
                    .cornerRadius(5)
            }
            .padding(.bottom)
            
        }
        .frame(width: 125)
        .frame(height: 150)
        .background(Color(.primary))
        .cornerRadius(10)
        .shadow(color: .lightGray, radius: 5, y: 3)
        .padding(.horizontal)
    }
}

struct SmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardView()
    }
}
