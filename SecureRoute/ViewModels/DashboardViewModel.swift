//
//  DashboardViewModel.swift
//  SecureRoute
//
//  Created by Aftab Shaikh on 23/12/25.
//

import Foundation
import Combine

@MainActor
final class DashboardViewModel: ObservableObject {

    // MARK: - Published State
    @Published var events: [BoardingEvent] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var showEmergencyOnly: Bool = false

    private let service = BoardingEventService()

    // MARK: - Load Data
    func loadEvents() async {
        isLoading = true
        defer { isLoading = false }

        do {
            events = try await service.fetchEvents()
        } catch {
            print("Failed to load events:", error)
            events = []
        }
    }

    // MARK: - Filtering Logic
    var filteredEvents: [BoardingEvent] {
        events.filter { event in
            let matchesSearch =
                searchText.isEmpty ||
                event.studentName.localizedCaseInsensitiveContains(searchText)

            let matchesEmergency =
                !showEmergencyOnly || event.isEmergency

            return matchesSearch && matchesEmergency
        }
    }
}
