//
//  NotificationView.swift
//  Evite
//
//  Created by Will morris on 9/21/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        HStack {
            Image("profile_pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .clipped()
                .padding(.leading)
                .padding(.vertical)
            
            VStack(alignment: .leading) {
                Text("@Becky_123")
                    .fontWeight(.semibold)
                
                Text("started following you. ")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()

            Button(action: {
                
            }, label: {
                Text("Follow back")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(8)
            })
            .background(Color.purple)
            .cornerRadius(2)
            .padding(.trailing)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .lightGray, radius: 5, y: 4)
        .padding(.horizontal)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
