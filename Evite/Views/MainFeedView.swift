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
            VStack {
                HStack {
                    Text("Happening Now")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        StoryCardView()
                            .padding(.vertical)
                            .padding(.leading)
                        StoryCardView()
                        StoryCardView()
                        StoryCardView()
                        StoryCardView()
                    }
                }
                
                HStack {
                    Text("For You")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
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
