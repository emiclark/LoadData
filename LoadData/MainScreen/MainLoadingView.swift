import SwiftUI

struct MainLoadingView: View {
  var body: some View {
    VStack {
      Text("Loading...")
    }
    .padding(20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.yellow)
  }
}

#Preview {
    MainLoadingView()
}
