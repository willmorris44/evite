//
//  MainFeedView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct MainFeedView: View {
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("Happening Now")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        StoryCardView(newPost: true)
                            .padding(.vertical)
                        StoryCardView()
                        StoryCardView(newPost: true)
                        StoryCardView(newPost: true)
                        StoryCardView()
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    Text("For You")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
                    BigCardView()
                        .padding(.vertical)
                    BigCardView()
                    BigCardView()
                    BigCardView()
                    BigCardView()
                }
            }
        }
    }
}

struct MainFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedView()
    }
}
