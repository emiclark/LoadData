import Foundation
import SwiftUI

struct MainContentDetailView: View {
  let item: MainDisplayModel
  
  init(
    item: MainDisplayModel
  ) {
    self.item = item
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Wrapper type: \(item.wrapperType.rawValue)")
        .padding(.vertical, 5)

      Text("Country: \(item.country.rawValue)")
        .padding(.vertical, 5)

      Text("Kind: \(item.kind.rawValue)")
        .padding(.vertical, 5)

      Spacer()
    }
    .frame(maxWidth: .infinity, alignment: .topLeading)
    .foregroundColor(.black)
    .font(.body)
    .padding(25)
    .navigationTitle(item.artistName)
  }
}
