//
//  CalendarView.swift
//  Evite
//
//  Created by Will morris on 9/13/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int, with proxy: GeometryProxy) -> some View {
        var offset = CGFloat(position * 75)
//        if offset > proxy.size.width - 50 {
//            offset = 0
//        }
        return self.offset(CGSize(width: offset, height: 0)).zIndex(Double(-position))
    }
}

struct CalendarView: View {
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach((1..<10)) { i in
                    HStack {
                        HStack {
                        Text("\(i)")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        }
                            //.layoutPriority(1)
                        
                        HStack {
                            ScrollView(.horizontal) {
                            ZStack {
                                ForEach((0..<10)) { j in
                                    SmallCardView()
                                        .stacked(at: j, in: 9, with: fullView)
                                    }
                            }
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: fullView.size.width)
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
