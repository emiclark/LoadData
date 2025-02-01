import Foundation

class ScreenViewModel: ObservableObject {
  @Published var loadingState: LoadingState<DisplayModel?> = .idle
  
  let displayModel: DisplayModel = DisplayModel(id: "1234", name: "anyName")
  
  func onAppear() async {
    try? await loadData()
  }

  func getUseCase() async throws -> DisplayModel? {
    try await Task.sleep(for: .seconds(1))
    
    let randomInt = Int.random(in: 0...1)
    
    switch randomInt {
      case 0:
        throw ScreenError.someError("Loading failed")
      case 1:
        return displayModel
      default:
        return nil
      }
  }
}

@MainActor
private extension ScreenViewModel {
  func loadData() async throws {
    loadingState = .loading(displayModel)

    do {
      if let model = try await getUseCase() {
        loadingState = .loaded(model)
      } else {
        loadingState = .loaded(nil)
      }
    } catch {
      loadingState = .failed(ScreenError.someError("Some error"))
    }
  }
}

extension ScreenViewModel {
  enum LoadingState<DisplayModel> {
    case idle
    case loading(DisplayModel)
    case loaded(DisplayModel)
    case failed(ScreenError)
  }

  enum ScreenError: Error {
    case someError(String)
  }
  
  struct DisplayModel: Equatable {
    let id: String
    let name: String
    
    static var placeholder = DisplayModel(id: "anyId", name: "anyName")
  }
}


