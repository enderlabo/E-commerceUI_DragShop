//
//  LocationModel.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 08/07/21.
//

import SwiftUI
import MapKit

struct Location: Codable, Identifiable{
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    //Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
