//
//  ProfileView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct ProfileSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct ProfileSizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: ProfileSizePreferenceKey.self, value: geometry.size)
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

struct ProfileView: View {
    @State private var showSettings = false
    @State private var segmentedControl = 0
    @State private var isScrolledToTop = false
    @State private var shouldScroll = true
    @State private var size: CGSize = .zero
    
    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                ZStack {
                    ScrollView(shouldScroll ? .vertical : [], showsIndicators: true) {
                        VStack {
                            ProfileHeaderView()
                                .padding()
                            
                            ZStack {
                                VStack {
                                    Divider()
                                    
                                    ProfileSegmentedController(selected: $segmentedControl)
                                    
                                    Divider()
                                }
                                .background(GeometryReader { geo in
                                    Color.white.onChange(of: geo.frame(in: .named("screen")).maxY, perform: { value in
                                        if geo.frame(in: .named("screen")).minY < 0 {
                                            isScrolledToTop = true
                                        } else if isScrolledToTop && geo.frame(in: .named("screen")).minY > 0 {
                                            isScrolledToTop = false
                                        }
                                    })
                                })
                                
                                if isScrolledToTop == false && segmentedControl == 0 {
                                    HStack {
                                        Text("Sept")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                            .fontWeight(.semibold)
                                        Spacer()
                                    }
                                    .padding(.leading)
                                    .offset(y: 50)
                                }
                            }
                            
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
                            
                            //                            TabView(selection: $segmentedControl) {
                            //                                CalendarView().tag(0)
                            //                                    .modifier(ProfileSizeModifier())
                            //                                BigCardView().tag(1)
                            //                            }
                            //                            .onPreferenceChange(ProfileSizePreferenceKey.self) { value in
                            //                                size = value
                            //                            }
                            //                            .frame(height: size.height)
                            //                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        }
                    }
                    
                    if isScrolledToTop {
                        VStack {
                            ZStack {
                                VStack {
                                    Divider()
                                    
                                    ProfileSegmentedController(selected: $segmentedControl)
                                    
                                    Divider()
                                }
                                .background(Color.white)
                                if segmentedControl == 0 {
                                    HStack {
                                        Text("Sept")
                                            .font(.callout)
                                            .foregroundColor(.gray)
                                            .fontWeight(.semibold)
                                        Spacer()
                                    }
                                    .padding(.leading)
                                    .offset(y: 50)
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
                NavigationLink(destination: SettingsView(), isActive: $showSettings) {
                    EmptyView()
                }
            }
            .coordinateSpace(name: "screen")
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
