import SwiftUI

struct MainErrorView: View {
  let error: MainScreenViewModel.MainScreenError
  
  var body: some View {
    VStack {
      Text("\(error.localizedDescription)")
    }
    .padding(20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.red)  }
}

#Preview {
  MainErrorView(error: MainScreenViewModel.MainScreenError.mappingError)
}

