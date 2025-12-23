//
//  SafeZoneOverlay.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import SwiftUI
import MapKit

struct SafeZoneOverlay: View {

    let center: CLLocationCoordinate2D

    var body: some View {
        GeometryReader { geo in
            Circle()
                .stroke(Color.blue.opacity(0.6), lineWidth: 2)
                .background(
                    Circle()
                        .fill(Color.blue.opacity(0.15))
                )
                .frame(width: 180, height: 180)
                .position(
                    x: geo.size.width / 2,
                    y: geo.size.height / 2
                )
        }
        .allowsHitTesting(false)
    }
}
