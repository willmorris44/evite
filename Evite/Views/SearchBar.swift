//
//  SearchBar.swift
//  Evite
//
//  Created by Will morris on 9/21/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            HStack {
                Icons.magnifyingGlass.image
                    .padding(.horizontal, 6)
                
                TextField("Search ...", text: $text)
            }
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)
            .onTapGesture {
                withAnimation(.spring()) {self.isEditing = true}
            }
            
            if isEditing {
                Button(action: {
                    withAnimation(.spring()) {self.isEditing = false}
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
        .padding(.vertical)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
