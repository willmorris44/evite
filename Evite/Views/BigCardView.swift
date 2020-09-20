//
//  BigCardView.swift
//  Evite
//
//  Created by Brian Hersh on 8/25/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct BigCardView: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("MGM Grand Party")
                        .fontWeight(.bold)
                        .font(.title)
                    
                    HStack {
                        Icons.calendar.image
                            .font(.subheadline)
                        
                        Text("July 14th 5:00-6:00pm")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Icons.dollarsignCircle.image
                            .font(.subheadline)
                        
                        Text("25 Points")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Icons.location.image
                            .font(.subheadline)
                        
                        Text("1.2 miles away")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Icons.elipses.image
                        .frame(width: 50, height: 30)
                        .font(.headline)
                        .onTapGesture {
                            self.showingSheet = true
                    }
                    .actionSheet(isPresented: $showingSheet) {
                        ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
                    }
                    Spacer()
                }
                .padding()
            }
            
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
                
                Text("Brian, Will, Winston + 3 more")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .layoutPriority(1)
                
                Spacer()
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 225)
        .background(Color(.primary))
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct BigCardView_Previews: PreviewProvider {
    static var previews: some View {
        BigCardView()
    }
}
