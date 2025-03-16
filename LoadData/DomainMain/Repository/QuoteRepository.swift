import Foundation

class GetQuoteRepository {
  let dataSource: GetQuoteDataSource
  
  init(dataSource: GetQuoteDataSource) {
    self.dataSource = dataSource
  }
  
  func getQuote() async throws -> QuoteEntity {
    let entity = try await dataSource.getQuote()
    return map(from: entity)
  }
  
  func map(from data: QuoteData) -> QuoteEntity {
    QuoteEntity(quote: data.quote)
  }
}
