//
//  MapView.swift
//  Evite
//
//  Created by Will morris on 9/22/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI
import MapKit

extension MKCoordinateRegion: Equatable {
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        return lhs.center.latitude == rhs.center.latitude && lhs.center.longitude == rhs.center.longitude
    }
}

extension View {
    func onTouchDownGesture(callback: @escaping (Bool) -> Void) -> some View {
        modifier(OnTouchDownGestureModifier(callback: callback))
    }
}

private struct OnTouchDownGestureModifier: ViewModifier {
    @State private var tapped = false
    let callback: (Bool) -> Void

    func body(content: Content) -> some View {
        content
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if !self.tapped {
                        self.tapped = true
                        self.callback(tapped)
                    }
                }
                .onEnded { _ in
                    self.tapped = false
                    self.callback(tapped)
                })
            .delayTouches()
    }
}

struct NoButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

extension View {
    func delayTouches() -> some View {
        Button(action: {}) {
            highPriorityGesture(TapGesture())
        }
        .buttonStyle(NoButtonStyle())
    }
}

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var mapService = MapService()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.2271, longitude: -80.8431), latitudinalMeters: 500, longitudinalMeters: 500)
    @State private var searchText = ""
    @State private var isDragging = false
        
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTouchDownGesture { tapped in
                    isDragging = tapped
                }
//                .onChange(of: region, perform: { value in
//                    mapService.updateAddress(value.center)
//                })
            
            VStack {
                SearchBar(text: $mapService.address)
                
                Spacer()
                
                VStack {
                    Image(systemName: "mappin")
                        .font(.title)
                        .foregroundColor(.purple)
                        .offset(y: isDragging ? 0 : 10)
                        .animation(.interactiveSpring())
                    
                    Ellipse()
                        .foregroundColor(.black)
                        .frame(width: 10, height: 5)
                }
                
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
