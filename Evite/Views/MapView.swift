//
//  MapView.swift
//  Evite
//
//  Created by Will morris on 9/22/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.2271, longitude: -80.8431), latitudinalMeters: 500, longitudinalMeters: 500)
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {
                SearchBar(text: $searchText)
                
                Spacer()
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.red)
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Select")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                })
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .cornerRadius(100)
                .padding()
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
