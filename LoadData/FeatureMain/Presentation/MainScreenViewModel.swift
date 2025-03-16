import Foundation

class MainScreenViewModel: ObservableObject {
  @Published var loadingState: LoadingState<MainDisplayModel> = .idle

  private let getQuoteUseCase: GetQuoteUseCase
  var displayModel: MainDisplayModel

  init(getQuoteUseCase: GetQuoteUseCase, displayModel: MainDisplayModel) {
    self.getQuoteUseCase = getQuoteUseCase
    self.displayModel = displayModel
  }
  
  func onAppear() async {
    try? await loadData()
  }
}

@MainActor
private extension MainScreenViewModel {
  func loadData() async throws {
    loadingState = .loading(displayModel)

    do {
      let model = try await getQuoteUseCase.getQuote()
      displayModel = try map(from: model)
      loadingState = .loaded(displayModel)
    } catch is MainScreenViewModel.MainScreenError {
      loadingState = .failed(MainScreenViewModel.MainScreenError.mappingError)
    } catch let error {
      throw error
    }
  }
}

extension MainScreenViewModel {
  func map(from source: QuoteModel) throws -> MainDisplayModel {
    guard let result = source.quote.first
    else {
      throw MappingError.toDisplayModel
    }
    return MainDisplayModel(quote: result.quote , author: result.author, category: result.category)
  }
}

extension MainScreenViewModel {
  enum LoadingState<MainDisplayModel> {
    case idle
    case loading(MainDisplayModel)
    case loaded(MainDisplayModel)
    case failed(MainScreenError)
  }

  enum MainScreenError: Error, CustomStringConvertible {
    case networkError
    case mappingError
    
    var description: String {
      switch self {
      case .networkError:
        return "Network error"
      case .mappingError:
        return "Mapping error"
      }
    }
  }
}


