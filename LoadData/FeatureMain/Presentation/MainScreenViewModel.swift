import Foundation

class MainScreenViewModel: ObservableObject {
  @Published var loadingState: LoadingState<MainDisplayModel> = .idle
  
  let displayModel: MainDisplayModel = MainDisplayModel(id: "1234", name: "anyName")
  
  func onAppear() async {
    try? await loadData()
  }

  func getUseCase() async throws -> MainDisplayModel? {
    try await Task.sleep(for: .seconds(1))
    
    let randomInt = Int.random(in: 0...2)
    
    switch randomInt {
      case 0:
        throw MainScreenError.networkError
      case 1:
        throw MainScreenError.mappingError
      default:
        return displayModel
      }
  }
}

@MainActor
private extension MainScreenViewModel {
  func loadData() async throws {
    loadingState = .loading(displayModel)

    do {
      if let model = try await getUseCase() {
        loadingState = .loaded(model)
      }
    } catch is MainScreenViewModel.MainScreenError {
      loadingState = .failed(MainScreenViewModel.MainScreenError.mappingError)
    } catch let error {
      throw error
    }
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


