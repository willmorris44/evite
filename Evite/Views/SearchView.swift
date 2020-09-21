//
//  SearchView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var searchTerm: String = ""
    
    init() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .primary
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchTerm)
                Spacer()
            }
            .navigationBarTitle("Search", displayMode: .inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
