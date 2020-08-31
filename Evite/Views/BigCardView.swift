//
//  BigCardView.swift
//  Evite
//
//  Created by Brian Hersh on 8/25/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct BigCardView: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("MGM Grand Party")
                        .fontWeight(.bold)
                        .font(.title)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .font(.subheadline)
                        
                        Text("July 14th 5:00-6:00pm")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .font(.subheadline)
                        
                        Text("25 Points")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Image(systemName: "location")
                            .font(.subheadline)
                        
                        Text("1.2 miles away")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                }
                .padding()
                
                VStack {
                    Image(systemName: "ellipsis")
                        .font(.headline)
                        .padding(.top, 10)
                    Spacer()
                }
                .padding()
                Spacer()
            }
            
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .font(.title)
                
                Image(systemName: "person.crop.circle.fill")
                    .font(.title)
                    .padding(.leading, -10)
                
                Image(systemName: "person.crop.circle.fill")
                    .font(.title)
                    .padding(.leading, -10)
                
                Text("Brian, Will, Winston + 3 more")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                Spacer()
            }
        .padding()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 225)
        .background(Color(.white))
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
