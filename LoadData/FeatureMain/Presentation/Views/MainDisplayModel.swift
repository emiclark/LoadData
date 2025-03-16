import Foundation

struct MainDisplayModel: Equatable {
  let id: String
  let name: String
  
  static var placeholder = MainDisplayModel(id: "anyId", name: "anyName")
}
