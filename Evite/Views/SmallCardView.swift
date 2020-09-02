//
//  SmallCardView.swift
//  Evite
//
//  Created by Will morris on 8/31/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct SmallCardView: View {
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
                Icons.personCircle.image
                    .font(.title)
                
                Icons.personCircle.image
                    .font(.title)
                    .padding(.leading, -20)
                
                Icons.personCircle.image
                    .font(.title)
                    .padding(.leading, -20)
                
                Text("+ 3")
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
            .padding()
            
            Button("Info") {
                
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
