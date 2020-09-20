//
//  ProfileSegmentedController.swift
//  Evite
//
//  Created by Will morris on 9/20/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ProfileSegmentedController: View {
    @Binding var selected: Int
    @Namespace private var animation
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Button(action: {
                    withAnimation(.spring()) { self.selected = 0 }
                }, label: {
                    Icons.calendar.image
                        .frame(width: 30, height: 30)
                        .foregroundColor((selected == 0) ? .black : .gray)
                })
                
                if selected == 0 {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .frame(width: 30, height: 2)
                        .padding(.top, 0.5)
                        .background(Color.black)
                        .matchedGeometryEffect(id: "shape", in: animation)
                }
            }
            
            Spacer()
            
            VStack {
                Button(action: {
                    withAnimation(.spring()) { self.selected = 1 }
                }, label: {
                    Image(systemName: "list.dash")
                        .frame(width: 30, height: 30)
                        .foregroundColor((selected == 1) ? .black : .gray)
                })
                
                if selected == 1 {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .frame(width: 30, height: 2)
                        .padding(.top, 0.5)
                        .background(Color.black)
                        .matchedGeometryEffect(id: "shape", in: animation)
                }
            }
        }
        .padding(.horizontal, 100)
    }
}

@available(iOS 14.0, *)
struct ProfileSegmentedController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSegmentedController(selected: .constant(0))
    }
}
