import SwiftUI

struct MainContentView: View {
  let quote: String
  let author: String
  let category: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(quote)
        .font(.body)
      +
      Text(" ~ \(author)")
        .fontWeight(.light)
        .italic()
    }
    .padding(20)
    .frame(width: 300, height: 300)
    .foregroundColor(.white)
    .background(Color.green)
  }
}

#Preview {
  MainContentView(quote: "aQuote", author: "aAuthor", category: "aCategory")
}
