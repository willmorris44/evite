//
//  ProfileSegmentedController.swift
//  Evite
//
//  Created by Will morris on 9/20/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

extension HorizontalAlignment {
    private enum MyHAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[HorizontalAlignment.center]
        }
    }
    
    static let myhAlignment = HorizontalAlignment(MyHAlignment.self)
}

struct ProfileSegmentedController: View {
    @Binding var selected: Int
    
    var body: some View {
        VStack(alignment: .myhAlignment) {
            HStack(alignment: .top) {
                VStack {
                   // if selected == 0 {
                        Button(action: {
                            withAnimation(.spring()) { selected = 0 }
                        }, label: {
                            Icons.calendar.image
                                .frame(width: 30, height: 30)
                                .foregroundColor((selected == 0) ? .black : .gray)
                        })
                        .alignmentGuide(selected == 0 ? .myhAlignment : HorizontalAlignment.center, computeValue: { d in
                            return d[HorizontalAlignment.center]
                        })
//                    } else {
//                        Button(action: {
//                            withAnimation(.spring()) { selected = 0 }
//                        }, label: {
//                            Icons.calendar.image
//                                .frame(width: 30, height: 30)
//                                .foregroundColor((selected == 0) ? .black : .gray)
//                        })
//                    }
                }
                
                Spacer()
                
                VStack {
                   // if selected == 1 {
                        Button(action: {
                            withAnimation(.spring()) { selected = 1 }
                        }, label: {
                            Image(systemName: "list.dash")
                                .frame(width: 30, height: 30)
                                .foregroundColor((selected == 1) ? .black : .gray)
                        })
                        .alignmentGuide(selected == 1 ? .myhAlignment : HorizontalAlignment.center, computeValue: { d in
                            return d[HorizontalAlignment.center]
                        })
//                    } else {
//                        Button(action: {
//                            withAnimation(.spring()) { selected = 1 }
//                        }, label: {
//                            Image(systemName: "list.dash")
//                                .frame(width: 30, height: 30)
//                                .foregroundColor((selected == 1) ? .black : .gray)
//                        })
//                    }
                }
            }
            .padding(.horizontal, 75)
            
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .frame(width: 40, height: 2)
                .background(Color.black)
                .alignmentGuide(.myhAlignment, computeValue: { d in
                    return d[HorizontalAlignment.center]
                })
        }
    }
}

struct ProfileSegmentedController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSegmentedController(selected: .constant(0))
    }
}
