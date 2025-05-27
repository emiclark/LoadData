import Foundation
import SwiftUI

struct ItemRow: View {
  let item: MainDisplayModel
  
  init(item: MainDisplayModel) {
    self.item = item
  }
  
  var body: some View {
    HStack {
      Text("\(item.id)")
      Spacer()
      Text(item.artistName)
      Spacer()
    }
  }
  
}


