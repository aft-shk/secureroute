//
//  BoardingEventService.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import Foundation

final class BoardingEventService {

    func fetchEvents() async throws -> [BoardingEvent] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)

        guard let url = Bundle.main.url(
            forResource: "boarding_events",
            withExtension: "json"
        ) else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return try decoder.decode([BoardingEvent].self, from: data)
    }
}
