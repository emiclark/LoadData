import Foundation

enum NetworkError: Error {
  case invalidURL
  case invalidURLRequest
  case invalidResponse
  case noData
  case decodingFailed
}

enum UseCaseError: Error {
  case invalidResponseForQuoteModel
}

enum MappingError: Error {
 case toDisplayModel
}
