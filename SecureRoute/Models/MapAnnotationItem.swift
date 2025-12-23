//
//  MapAnnotationItem.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import Foundation
import CoreLocation

struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
