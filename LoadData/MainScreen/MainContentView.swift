import SwiftUI

struct MainContentView: View {
  let id: String
  let name: String
  
  var body: some View {
    VStack {
      Text("Data loaded")
      Text("id: \(id), name: \(name)")
    }
    .font(.body)
    .padding(.top, 20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.green)
  }
}

#Preview {
  MainContentView(id: "123", name: "anyName")
}
