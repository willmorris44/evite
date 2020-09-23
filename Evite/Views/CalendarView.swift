//
//  CalendarView.swift
//  Evite
//
//  Created by Will morris on 9/13/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct CalendarSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSizeEQ = CGSizeEQ(.zero, .zero)
    
    static func reduce(value: inout CGSizeEQ, nextValue: () -> CGSizeEQ) {
        value = nextValue()
    }
}

class CGSizeEQ: Equatable {
    var left: CGSize
    var right: CGSize
    
    init(_ left: CGSize, _ right: CGSize) {
        self.left = left
        self.right = right
    }
    
    static func == (lhs: CGSizeEQ, rhs: CGSizeEQ) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right
    }
    
    
}

struct ChildSizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.transformPreference(CalendarSizePreferenceKey.self, {$0.left = geometry.size})
        }
    }
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

struct ParentSizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.transformPreference(CalendarSizePreferenceKey.self, {$0.right = geometry.size})
        }
    }
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

struct CalendarView: View {
    @State var size: CGSize = .zero
    @State var offset: CGFloat = 0
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 0) {
            ForEach(Date().thisWeek()) { date in
                HStack {
                    Text("\(date.day)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width: 50)
                        .padding(.leading)
                        .lineLimit(1)
                        .modifier(ParentSizeModifier())

                        HStack(spacing: 0) {
                            ForEach((0..<4)) { i in
                                SmallCardView()
                                    .modifier(ChildSizeModifier())
                                    .offset(x: i > 0 ? (offset * CGFloat(i)) : 0)
                                    .zIndex(-Double(i))
                            }
                        }
                        .padding(.vertical)
                }
                .onPreferenceChange(CalendarSizePreferenceKey.self) { value in
                    let width = UIScreen.main.bounds.width - value.right.width
                    let diff = width - (value.left.width*4)
                    offset = diff / 3
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
