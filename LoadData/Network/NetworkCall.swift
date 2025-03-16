import Foundation

protocol NetworkCallable {
  static func execute(for request: URLRequest) async throws -> (Data?, HTTPURLResponse?)
}

struct NetworkCall: NetworkCallable {
  static func execute(for request: URLRequest) async throws -> (Data?, HTTPURLResponse?) {
    let (data, response) = try await URLSession.shared.data(for: request)
    return (data, response as? HTTPURLResponse)
  }
}
