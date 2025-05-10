import Foundation

class GetQuoteDataSource {
  private let networkCall: NetworkCallable
  private let jsonDecoder: JSONDecodable
  
  init(networkCall: NetworkCallable, jsonDecoder: JSONDecodable) {
    self.networkCall = networkCall
    self.jsonDecoder = jsonDecoder
  }
  
  func getQuote() async throws -> QuoteData {
    // check valid url
    guard let url = URL(string: Endpoint.getQuote)
    else {
      throw NetworkError.invalidURL
    }
    
    // make urlRequest
    var request = URLRequest(url: url)
    
    // construct HTTP request
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    request.setValue("fEykI/K4HRP/YqUU9u0wTQ==pdiDrwD0s5LvUxkv", forHTTPHeaderField: "X-Api-Key")
    
    let networkCall = NetworkCall(urlSession: URLSession.shared)
    let (data, httpURLResponse) = try await networkCall.execute(for: request)
    
    // check for valid response
    guard let data,
          let httpURLResponse,
          httpURLResponse.statusCode >= 200 && httpURLResponse.statusCode < 300
    else {
      throw NetworkError.invalidResponse
    }
    
    // decode into QuoteData and return
    do {
      let result = try JSONDecoder().decode([Quote].self, from: data)
      return QuoteData(quote: result)
    } catch {
      throw NetworkError.decodingFailed
    }
    
  }
}
