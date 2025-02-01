import Foundation

class ScreenViewModel: ObservableObject {
  @Published var loadingState: LoadingState = .idle
  
  let displayModel: DisplayModel = DisplayModel(id: "1234", name: "anyName")
  
  func onAppear() {
    loadingState = .loading(DisplayModel.placeholder)
    loadData()
  }
  
  func loadData() {
    do {
      if let displayModel = try getUseCase() {
        loadingState = .loaded(displayModel)
      }
    } catch {
      loadingState = .failed(ScreenError.networkError("Network Error"))
    }
  }
  
  func getUseCase() throws -> DisplayModel? {
//    let randomInt = Int.random(in: 0...1)
      
    let randomInt = 0
    
    switch randomInt {
      case 0:
      loadingState = .failed(ScreenError.networkError("Loading failed"))
      throw ScreenError.networkError("Error")
      case 1:
        loadingState = .loaded(displayModel)
      default:
        break
      }
    
    print("randomInt: \(randomInt)")
    
    return displayModel
  }
}


extension ScreenViewModel {
  enum LoadingState {
    case idle
    case loading(DisplayModel)
    case loaded(DisplayModel)
    case failed(ScreenError)
  }
}


enum ScreenError: Error {
  case networkError(String)
}

struct DisplayModel {
  let id: String
  let name: String
  
  static var placeholder = DisplayModel(id: "anyId", name: "anyName")
}
