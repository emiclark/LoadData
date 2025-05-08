import Foundation

class GetArtistDataSource {
  private let networkCall: NetworkCall
  private let jsonDecoder: JSONDecodable
  
  init(networkCall: NetworkCall, jsonDecoder: JSONDecodable) {
    self.networkCall = networkCall
    self.jsonDecoder = jsonDecoder
  }
  
  func getArtist() async throws -> ArtistData {
    // check valid url
    guard let url = URL(string: Endpoint.getItunes)
    else {
      throw NetworkError.invalidURL
    }
    
    // make URLRequest
    var request = URLRequest(url: url)
    
    // construct HTTPHeaders
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    
    let (data, response) = try await networkCall.execute(for: request)
    
    // check for valid response
    guard let data,
          let response,
          response.statusCode >= 200 && response.statusCode < 300
    else {
      throw NetworkError.invalidResponse
    }
    
    // decode into Artist
    do {
      let result = try JSONDecoder().decode(ArtistData.self, from: data)
      
      result.results.forEach { artist in
        print(artist.artistName)
      }

      return ArtistData(
        results: result.results
      )
    } catch {
      throw DecodingError.decodingFailed
    }
  }
}
