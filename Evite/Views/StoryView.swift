//
//  StoryView.swift
//  Evite
//
//  Created by Will morris on 9/22/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI
import AVKit

struct StoryView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://bit.ly/swswift")!)) {
            VStack {
                Text("Watermark")
                    .font(.caption)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Capsule())
                
                Spacer()
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
