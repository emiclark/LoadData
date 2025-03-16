import SwiftUI

struct MainIdleView: View {
  var body: some View {
    VStack {
      Text("Idle... 😴 ")
    }
    .padding(20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.gray)
  }
}

#Preview {
    MainIdleView()
}
