//
//  StatusBadge.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import SwiftUI

struct StatusBadge: View {

    let status: EventStatus

    var body: some View {
        Text(status.rawValue)
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
    }

    private var backgroundColor: Color {
        switch status {
        case .boarded:
            return .green
        case .exited:
            return .blue
        case .unauthorized:
            return .red
        }
    }
}
