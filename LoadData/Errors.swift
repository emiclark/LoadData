import Foundation

enum NetworkError: Error {
  case invalidURL
  case invalidURLRequest
  case invalidResponse
  case noData
}

enum UseCaseError: Error {
  case invalidResponseForQuoteModel
}

enum DecodingError: Error {
  case decodingFailed
}

enum MappingError: Error {
  case toDisplayModelFailed
  case DataToEntityFailed
  case EntityToModelFailed
  case ModelToDisplayModelFailed
}
