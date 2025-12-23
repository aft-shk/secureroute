

#  SecureRoute – Safety Dashboard

SecureRoute is a SwiftUI-based iOS application that displays a **live feed of student boarding events** along with a **simulated Safe Zone map**.
The app demonstrates clean architecture, modern Swift concurrency, and a polished UI suitable for real-time monitoring use cases.

---

## Features

### Safety Feed

* Scrollable list of student boarding events
* Displays:

  * Student Name & ID
  * Status badge (Boarded / Exited / Unauthorized)
  * Timestamp
* Search students by name
* Toggle to show **Emergency / Alert** events only

### Interactive Map

* MapKit integration
* School **Safe Zone** shown as a circular overlay
* **Bus location** pin (simulated)
* Map centered on **Aurangabad, Maharashtra**

### Live Indicator

* Subtle animated **LIVE** indicator
* Multi-layer pulse effect to indicate real-time updates

### State Handling

* Loading state
* Empty state
* Data-loaded state

---

## Architecture

The app follows the **MVVM (Model–View–ViewModel)** architecture.

```
JSON (Mock Data)
   ↓
Service (Async/Await)
   ↓
ViewModel (Business Logic)
   ↓
SwiftUI Views
```

### Why MVVM?

* Clear separation of concerns
* Easy to test business logic
* Scales well for real applications

---

## Tech Stack

* **SwiftUI** – UI development
* **MapKit** – Map & location visualization
* **Async/Await** – Mock network data fetching
* **XCTest** – Unit testing
* **MVVM** – Architecture pattern

No third-party libraries are used.

---

## Mock Data

* Data is loaded from a local JSON file:

  ```
  Resources/MockData/boarding_events.json
  ```
* Simulates a real network response
* Parsed using `Codable` with ISO-8601 timestamps

---

## Unit Tests

Two unit tests are included using **XCTest**:

1. **Search Filtering Test**

   * Verifies filtering by student name
2. **Emergency Filter Test**

   * Verifies that only emergency events are shown when enabled

Tests focus purely on **ViewModel logic**, independent of UI.

---

## How to Run

1. Open the project in **Xcode**
2. Select an iOS Simulator or a physical iPhone
3. Press **Run (▶️)**

> The app has also been tested on a real iPhone device.

---




