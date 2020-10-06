//
//  MapService.swift
//  Evite
//
//  Created by Will morris on 9/28/20.
//  Copyright © 2020 william. All rights reserved.
//

import Foundation
import MapKit

class MapService: ObservableObject {
    @Published var address = ""
    
    func updateAddress(_ point: CLLocationCoordinate2D) {
        getAddressFromLatLon(pdblLatitude: point.latitude, withLongitude: point.longitude)
    }
    
    private func getAddressFromLatLon(pdblLatitude: Double, withLongitude pdblLongitude: Double) {
            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
            let ceo: CLGeocoder = CLGeocoder()
            center.latitude = pdblLatitude
            center.longitude = pdblLongitude

            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


            ceo.reverseGeocodeLocation(loc, completionHandler:
                {(placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                    guard let pm = placemarks else { print(#function); return }

                    if pm.count > 0 {
                        let pm = placemarks![0]
                        print(pm.country)
                        print(pm.locality)
                        print(pm.subLocality)
                        print(pm.thoroughfare)
                        print(pm.postalCode)
                        print(pm.subThoroughfare)
                        var addressString : String = ""
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country! + ", "
                        }
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + " "
                        }

                        print(addressString)
                        self.address = addressString
                  }
            })

        }
}
