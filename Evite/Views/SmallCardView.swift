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
    var body: some View {
        VStack {
            Text("MGM Grand Party")
                .fontWeight(.bold)
                .font(.headline)
                .lineLimit(1)
            
            Text("25 Points")
                .fontWeight(.semibold)
                .font(.subheadline)
            
            HStack {
                Image("profile_pic_2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 25, maxHeight: 25)
                    .clipShape(Circle())
                    .clipped()
                
                Image("profile_pic_3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 25, maxHeight: 25)
                    .clipShape(Circle())
                    .clipped()
                    .padding(.leading, -20)
                
                Image("profile_pic_4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 25, maxHeight: 25)
                    .clipShape(Circle())
                    .clipped()
                    .padding(.leading, -20)
                
                Text("+ 3")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .lineLimit(1)
                    .layoutPriority(1)
            }
            .padding()
            
            NavigationLink(destination: Text("hll"), isActive: $isShow) {
                EmptyView()
            }
            Button("Info") {
                self.isShow = true
            }
            .frame(width: 100)
            .foregroundColor(.primary)
            .background(Color(.secondary))
            .cornerRadius(5)
            
        }
        .frame(width: 125)
        .frame(height: 150)
        .background(Color(.primary))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        }
        
}

struct SmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardView()
    }
}
