//
//  LiveIndicatorView.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import SwiftUI

struct LiveIndicatorView: View {

    @State private var animate = false

    var body: some View {
        HStack(spacing: 8) {

            ZStack {
                // Outer ripple
                Circle()
                    .stroke(Color.red.opacity(0.4), lineWidth: 2)
                    .frame(width: animate ? 20 : 10, height: animate ? 20 : 10)
                    .opacity(animate ? 0 : 1)

                // Inner dot
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
                    .shadow(color: .red.opacity(0.6), radius: 6)
            }
            .animation(
                .easeOut(duration: 1.2).repeatForever(autoreverses: false),
                value: animate
            )

            Text("LIVE")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.red)
        }
        .onAppear {
            animate = true
        }
    }
}
