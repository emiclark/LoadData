import Foundation

protocol NetworkCallable {
  static func execute(for request: URLRequest) async throws -> (Data?, HTTPURLResponse?)
}

class NetworkCall: NetworkCallable {
  let urlSession: URLSession
  
  init(urlSession: URLSession) {
    self.urlSession = urlSession
  }
  
  static func execute(for request: URLRequest) async throws -> (Data?, HTTPURLResponse?) {
    let (data, response) = try await urlSession.data(for: request)
    return (data, response as? HTTPURLResponse)
  }
}
