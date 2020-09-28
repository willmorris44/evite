//
//  ProfileView.swift
//  Evite
//
//  Created by Will morris on 9/26/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct HeaderSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct HeaderSizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeaderSizePreferenceKey.self, value: geometry.size)
        }
    }
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

struct SegSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct SegSizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: SegSizePreferenceKey.self, value: geometry.size)
        }
    }
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

struct ProfileView: View {
    @State private var segmentedControl = 0
    @State private var headerSize: CGSize = .zero
    @State private var segSize: CGSize = .zero
    @State private var headerOffset: CGFloat = 0
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                ZStack {
                    NavigationLink(destination: SettingsView(), isActive: $showSettings) {
                        EmptyView()
                    }
                    PagerView(pageCount: 2, currentIndex: $segmentedControl) {
                        ScrollView {
                            ScrollViewReader { reader in
                                Rectangle()
                                    .frame(height: headerSize.height + segSize.height)
                                    .foregroundColor(.white)
                                    .id(2)
                                    .background(GeometryReader { geo in
                                        Color.clear.onChange(of: geo.frame(in: .named("ProfileScreen")).minY, perform: { value in
                                            if segmentedControl == 0 {
                                                if geo.frame(in: .named("ProfileScreen")).minY > -headerSize.height {
                                                    headerOffset = value
                                                } else {
                                                    headerOffset = -headerSize.height
                                                }
                                            }
                                        })
                                    })
                                    .onChange(of: headerOffset, perform: { value in
                                        if segmentedControl == 1 {
                                            let childHeight = headerSize.height + segSize.height
                                            let point = value / (fullView.size.height - childHeight)
                                            
                                            reader.scrollTo(2, anchor: UnitPoint(x: 0, y: point))
                                        }
                                    })
//                                CalendarView()
//                                    .padding(.top)
                                BigCardView()
                                    .padding(.top)
                                BigCardView()
                                BigCardView()
                                BigCardView()
                            }
                        }
                        
                        ScrollView {
                            ScrollViewReader { reader in
                                Rectangle()
                                    .frame(height: headerSize.height + segSize.height)
                                    .foregroundColor(.white)
                                    .id(1)
                                    .background(GeometryReader { geo in
                                        Color.clear.onChange(of: geo.frame(in: .named("ProfileScreen")).minY, perform: { value in
                                            if segmentedControl == 1 {
                                                if geo.frame(in: .named("ProfileScreen")).minY > -headerSize.height {
                                                    headerOffset = value
                                                } else {
                                                    headerOffset = -headerSize.height
                                                }
                                            }
                                        })
                                    })
                                    .onChange(of: headerOffset, perform: { value in
                                        if segmentedControl == 0 {
                                            let childHeight = headerSize.height + segSize.height
                                            let point = value / (fullView.size.height - childHeight)
                                            
                                            reader.scrollTo(1, anchor: UnitPoint(x: 0, y: point))
                                        }
                                    })
                                BigCardView()
                                    .padding(.top)
                                BigCardView()
                                BigCardView()
                                BigCardView()
                            }
                        }
                    }
                    
                    VStack {
                        VStack(spacing: 0) {
                            ProfileHeaderView()
                                .modifier(HeaderSizeModifier())
                            
                            VStack {
                                Divider()

                                ProfileSegmentedController(selected: $segmentedControl)
                                
                                Divider()
                            }
                            .modifier(SegSizeModifier())

                        }
                        .background(Color.white)
                        .offset(y: headerOffset)
                        
                        Spacer()
                    }
                }
            }
            .coordinateSpace(name: "ProfileScreen")
            .navigationBarTitle("Profile", displayMode: .inline)
//            .navigationBarItems(trailing: Button(action: {
//                showSettings = true
//            }, label: {
//                Icons.elipses.image
//                    .font(.headline)
//                    .frame(width: 50, height: 30)
//                    .foregroundColor(.black)
//            }))
            
        }.onPreferenceChange(HeaderSizePreferenceKey.self) { value in
            print("HeaderKey: \(value)")
            headerSize = value
        }
        .onPreferenceChange(SegSizePreferenceKey.self) { value in
            print("SegKey: \(value)")
            segSize = value
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
