import UIKit

enum NetworkError: Error {
    case connectionLost
}

func fetchData() async throws -> String {
    // Simulate fetching data asynchronously
    await Task.sleep(1 * 1_000_000_000) // Sleep for 1 second
    // Simulate error
    throw NetworkError.connectionLost
    // Simulate successful data retrieval
    return "Data fetched successfully"
}

func fetchDataAndHandleError() async {
    do {
        let data = try await fetchData()
        print("Data: \(data)")
    } catch {
        print("Error fetching data: \(error)")
    }
}

Task {
    await fetchDataAndHandleError()
}
