//
//  SafeZoneMapView.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import SwiftUI
import MapKit

struct SafeZoneMapView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 19.8762,   // Example: Delhi
            longitude: 75.3433
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.01,
            longitudeDelta: 0.01
        )
    )

    // School location
    private let schoolCoordinate = CLLocationCoordinate2D(
        latitude: 19.8762,
        longitude: 75.3433
    )

    // Bus location (slightly offset)
    private let busLocation = MapAnnotationItem(
        coordinate: CLLocationCoordinate2D(
            latitude: 19.8780,
            longitude: 75.3450
        )
    )


    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [busLocation]) { item in
            MapMarker(coordinate: item.coordinate, tint: .blue)
        }

        .overlay {
            SafeZoneOverlay(center: schoolCoordinate)
        }
        .frame(height: 220)
        .cornerRadius(16)
        .padding()
    }
}
