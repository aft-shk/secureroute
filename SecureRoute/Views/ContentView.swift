import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // MAP AT TOP
                SafeZoneMapView()

                // Emergency Toggle
                Toggle("Show Emergency Only", isOn: $viewModel.showEmergencyOnly)
                    .padding(.horizontal)

                // Content States
                if viewModel.isLoading {
                    ProgressView("Loading events...")
                        .padding()
                } else if viewModel.filteredEvents.isEmpty {
                    Text("No events found")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.filteredEvents) { event in
                        EventRowView(event: event)
                    }
                    .listStyle(.plain)
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    LiveIndicatorView()
                }
            }
            .navigationTitle("SecureRoute")
            .searchable(text: $viewModel.searchText)
            .task {
                await viewModel.loadEvents()
            }
        }
    }

}
