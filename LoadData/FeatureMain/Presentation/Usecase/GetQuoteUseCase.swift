import Foundation

class GetQuoteUseCase {
  private let getQuoteRepository: GetQuoteRepository
  
  init(getQuoteRepository: GetQuoteRepository) {
    self.getQuoteRepository = getQuoteRepository
  }
  
  func getQuote() async throws -> QuoteModel {
    let entity = try await getQuoteRepository.getQuote()
    return map(from: entity)
  }
  
  func map(from entity: QuoteEntity) -> QuoteModel {
    QuoteModel(quote: entity.quote)
  }
}
      
