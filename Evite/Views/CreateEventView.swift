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
    @State private var mapIsPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Name of event")
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        TextField("ex: John's Birthday Party", text: $title)
                            .font(.headline)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    Divider()
                        .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Place of event")
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        TextField("ex: 123 Grand Ave", text: $place)
                            .font(.headline)
                            .onTapGesture {
                                self.mapIsPresented.toggle()
                            }
                    }
                    
                    Divider()
                        .padding(.bottom)
                    
                    DatePicker(selection: $date, displayedComponents: [DatePickerComponents.hourAndMinute, DatePickerComponents.date]) {
                        Text("Select a time")
                            .font(.headline)
                    }.accentColor(.black)
                }
                .padding()
                
                Spacer()
                
                BigCardView()
                                
                Button(action: {
                    
                }, label: {
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                })
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .cornerRadius(100)
                .padding()
                
                Spacer()
            }
            .padding(.vertical)
            .navigationBarTitle("Create", displayMode: .inline)
        }
        .fullScreenCover(isPresented: $mapIsPresented, content: MapView.init)
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
