//
//  PagerView.swift
//  Evite
//
//  Created by Will morris on 9/26/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content

    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }
    @GestureState private var translation: CGFloat = 0
    let width = UIScreen.main.bounds.width
    var body: some View {
        // GeometryReader { geometry in
        HStack(spacing: 0) {
            content.frame(width: width)
        }
        .frame(width: width, alignment: .leading)
        .background(Color.white)
        .offset(x: -CGFloat(currentIndex) * width)
        .offset(x: setOffset())
        .animation(.interactiveSpring())
        .gesture(
            DragGesture()
                .updating($translation) { value, state, _ in
                    state = value.translation.width
                }
                .onEnded { value in
                    let offset = value.translation.width / width
                    let newIndex = (CGFloat(currentIndex) - offset).rounded()
                    withAnimation(.interactiveSpring()) {currentIndex = min(max(Int(newIndex), 0), pageCount - 1)}
                }
        )
        //}
    }

    private func setOffset() -> CGFloat {
        if currentIndex == 0 {
            return translation < 0 ? translation : 0
        } else {
            return translation > 0 ? translation : 0
        }
    }
}
