//
//  ProfileView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct SizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

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
            self.content.frame(width: width)
        }
        .frame(width: width, alignment: .leading)
        .offset(x: -CGFloat(self.currentIndex) * width)
        .offset(x: self.setOffset())
        .animation(.interactiveSpring())
        .gesture(
            DragGesture().updating(self.$translation) { value, state, _ in
                state = value.translation.width
            }.onEnded { value in
                let offset = value.translation.width / width
                let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
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

extension VerticalAlignment {
    private enum MyVerticalAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    
    static let myVerticalAlignment = VerticalAlignment(MyVerticalAlignment.self)
}

extension HorizontalAlignment {
    private enum MyHorizontalAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.leading]
        }
    }
    
    static let myHorizontalAlignment = HorizontalAlignment(MyHorizontalAlignment.self)
}

//extension Alignment {
//    static let myAlignment = Alignment(horizontal: .myHorizontalAlignment, vertical: .myVerticalAlignment)
//}

extension VerticalAlignment {
    private enum MyAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let myAlignment = VerticalAlignment(MyAlignment.self)
}

struct ProfileView: View {
    @State private var showSettings = false
    @State private var segmentedControl = 0
    @State private var shouldScroll = false
    @State private var contentSize: CGSize = CGSize(width: 0, height: 50) {
        didSet {
            print(contentSize)
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                ScrollView(.vertical, showsIndicators: true) {
                    ZStack {
                        
                        VStack {
                            ProfileHeaderView()
                                .padding()
                            
                            Rectangle()
                                .foregroundColor(.clear)
                            
                            PagerView(pageCount: 2, currentIndex: $segmentedControl) {
                                CalendarView()
                                
                                VStack {
                                    BigCardView()
                                    BigCardView()
                                    BigCardView()
                                    BigCardView()
                                    Spacer()
                                }
                            }
                        }
                        .alignmentGuide(.myAlignment, computeValue: { d in d[VerticalAlignment.top] })
                        
                        VStack {
                            VStack {
                                Divider()
                                
                                ProfileSegmentedController(selected: $segmentedControl)
                                
                                Divider()
                            }
                            .background(Color.white)
                            .alignmentGuide(.myAlignment, computeValue: { d in d[VerticalAlignment.bottom] })
                            
                            Spacer()
                        }
                    }
                }
                NavigationLink(destination: SettingsView(), isActive: $showSettings) {
                    EmptyView()
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.showSettings = true
            }, label: {
                Icons.elipses.image
                    .font(.headline)
                    .frame(width: 50, height: 30)
                    .foregroundColor(.black)
            }))
            .navigationBarTitle("Becky", displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
