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
        NavigationView {
            GeometryReader { fullView in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Happening Now")
                                .font(.caption)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                StoryCardView(newPost: true)
                                StoryCardView()
                                StoryCardView(newPost: true)
                                StoryCardView(newPost: true)
                                StoryCardView()
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                            .padding(.top, 4)
                        }
                        
                        HStack {
                            Text("For You")
                                .font(.headline)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        LazyVStack {
                            BigCardView()
                            BigCardView()
                            BigCardView()
                            BigCardView()
                            BigCardView()
                        }
                    }
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct MainFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedView()
    }
}
