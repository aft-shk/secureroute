//
//  EventRowView.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import SwiftUI

struct EventRowView: View {

    let event: BoardingEvent

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(event.studentName)
                    .font(.headline)

                Spacer()

                StatusBadge(status: event.status)
            }

            Text("ID: \(event.studentId)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(event.timestamp.formatted(date: .abbreviated, time: .shortened))
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 6)
    }
}
