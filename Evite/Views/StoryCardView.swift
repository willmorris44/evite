//
//  StoryCardView.swift
//  Evite
//
//  Created by Will morris on 9/15/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct StoryCardView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .font(.largeTitle)
                .padding(.top)
            
            Text("Goodbye Party")
                .fontWeight(.semibold)
                .font(.footnote)
                .lineLimit(1)
                .padding(.horizontal)
                .padding(.top)
            
            Text("9pm - 2am")
                .fontWeight(.light)
                .font(.caption)
                .lineLimit(1)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .frame(width: 100)
        .frame(height: 115)
        .background(Color.primary)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct StoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCardView()
    }
}