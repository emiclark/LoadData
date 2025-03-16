import Foundation

protocol NetworkCallable {
  func execute(from url: String, urlSession: URLSession) async throws -> (Data?, HTTPURLResponse?)
}

