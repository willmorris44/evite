//
//  CreateEventView.swift
//  Evite
//
//  Created by Will morris on 9/1/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct CreateEventView: View {
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var place: String = ""
    
    init() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .primary
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Title", text: $title)
                        .font(.title)
                        .padding(.top)
                    
                    TextField("Where", text: $place)
                        .font(.title)

                    if #available(iOS 14.0, *) {
                        DatePicker("", selection: $date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(width: 300)
                    } else {
                        DatePicker("", selection: $date)
                    }
                }
                .padding()
                
                BigCardView()
            }
            .navigationBarTitle("Create", displayMode: .inline)
            .padding(.vertical)
        }
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
