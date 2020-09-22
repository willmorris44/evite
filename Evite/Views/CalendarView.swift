//
//  CalendarView.swift
//  Evite
//
//  Created by Will morris on 9/13/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

extension View {
    func stacked(at position: Int, total: Int, space: CoordinateSpace) -> some View {
        self.background(GeometryReader { geo in
            let diff = geo.frame(in: space).width - (geo.size.width * CGFloat(total))
            let offset = diff / CGFloat(total-1)
            if position > 1 {
                self.offset(CGSize(width: -offset, height: 0))
            }
            self.zIndex(Double(-position))
        })
    }
}

struct CalendarView: View {
    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(Date().thisWeek()) { date in
                HStack {
                    Text("\(date.day)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width: 50)
                        .padding(.leading)
                        .lineLimit(1)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach((0..<9)) { i in
                                SmallCardView()
                                //.stacked(at: i, total: 3, space: .named("calendarRow"))
                            }
                        }
                        .padding(.vertical)
                    }
                    .coordinateSpace(name: "calendarRow")
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
