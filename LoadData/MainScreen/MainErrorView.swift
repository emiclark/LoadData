import SwiftUI

struct MainErrorView: View {
  let errorMessage: String
  
  var body: some View {
    VStack {
      Text("Error: \(errorMessage)")
    }
    .padding(20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.red)  }
}

#Preview {
  MainErrorView(errorMessage: "Error")
}

