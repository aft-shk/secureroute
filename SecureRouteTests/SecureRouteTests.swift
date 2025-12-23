//
//  SecureRouteTests.swift
//  SecureRouteTests
//
//  Created by Aftab Shaikh on 23/12/25.
//

@testable import SecureRoute
import XCTest

@MainActor
final class SecureRouteTests: XCTestCase {

    var viewModel: DashboardViewModel!

    override func setUp() {
        super.setUp()
        viewModel = DashboardViewModel()

        viewModel.events = [
            BoardingEvent(
                id: UUID(),
                studentName: "Aarav Sharma",
                studentId: "STU-101",
                status: .boarded,
                timestamp: Date(),
                isEmergency: false
            ),
            BoardingEvent(
                id: UUID(),
                studentName: "Riya Mehta",
                studentId: "STU-102",
                status: .unauthorized,
                timestamp: Date(),
                isEmergency: true
            ),
            BoardingEvent(
                id: UUID(),
                studentName: "Kabir Singh",
                studentId: "STU-103",
                status: .exited,
                timestamp: Date(),
                isEmergency: false
            )
        ]
    }

    func testSearchFilteringByStudentName() {
        viewModel.searchText = "Riya"

        let filtered = viewModel.filteredEvents

        XCTAssertEqual(filtered.count, 1)
        XCTAssertEqual(filtered.first?.studentName, "Riya Mehta")
    }

    func testEmergencyFilterShowsOnlyEmergencyEvents() {
        viewModel.showEmergencyOnly = true

        let filtered = viewModel.filteredEvents

        XCTAssertEqual(filtered.count, 1)
        XCTAssertTrue(filtered.first?.isEmergency ?? false)
    }
}
