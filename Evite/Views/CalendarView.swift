//
//  CalendarView.swift
//  Evite
//
//  Created by Will morris on 9/13/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        var offset = CGFloat(position * -75)
        return self.offset(CGSize(width: offset, height: 0)).zIndex(Double(-position))
    }
}

struct CalendarView: View {
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Date().thisWeek()) { date in
                HStack {
                    HStack {
                        Text("\(date.day)")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                    }
                    //.layoutPriority(1)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach((0..<10)) { j in
                                SmallCardView()
                                //.stacked(at: j, in: 9)
                            }
                        }
                        .padding(.vertical)
                    }
                    
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
