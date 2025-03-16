import Foundation

struct MainDisplayModel: Decodable {
  let quote: String
  let author: String
  let category: String
}


struct Quote: Decodable {
  let quote: String
  let author: String
  let category: String
}
