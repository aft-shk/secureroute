//
//  BoardingEvent.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import Foundation

struct BoardingEvent: Identifiable, Codable {
    let id: UUID
    let studentName: String
    let studentId: String
    let status: EventStatus
    let timestamp: Date
    let isEmergency: Bool
}
