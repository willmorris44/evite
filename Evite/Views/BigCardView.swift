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
                
                VStack {
                    Icons.elipses.image
                        .font(.headline)
                        .padding(.top, 10)
                    Spacer()
                }
                .padding()
                Spacer()
            }
            
            HStack {
                Icons.personCircle.image
                    .font(.title)
                
                Icons.personCircle.image
                    .font(.title)
                    .padding(.leading, -10)
                
                Icons.personCircle.image
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
