import Foundation

class ScreenViewModel: ObservableObject {
  @Published var loadingState: LoadingState<DisplayModel?> = .idle
  
  let displayModel: DisplayModel = DisplayModel(id: "1234", name: "anyName")
  
  func onAppear() async {
    loadingState = .loading(displayModel)
    try? await loadData()
  }
  
  @MainActor
  func loadData() async throws {
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

  @MainActor
  func getUseCase() async throws -> DisplayModel? {
    try await Task.sleep(for: .seconds(1))
    
    let randomInt = Int.random(in: 0...1)
    
    switch randomInt {
      case 0:
      loadingState = .failed(ScreenError.someError("Loading failed"))
        throw ScreenError.someError("Loading failed")
      case 1:
        loadingState = .loading(displayModel)
      case 2:
        loadingState = .loaded(displayModel)
      default:
        break
      }
    return displayModel
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


