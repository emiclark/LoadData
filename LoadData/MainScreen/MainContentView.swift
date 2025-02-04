import SwiftUI

struct MainContentView: View {
  var body: some View {
    VStack {
      Text("Hello, World!!!!")
    }
    .font(.body)
    .padding(.top, 20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.green)
  }
}

#Preview {
    MainContentView()
}
