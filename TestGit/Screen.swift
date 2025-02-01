import SwiftUI

struct Screen: View {
  @ObservedObject var viewModel: ScreenViewModel
  
  init(viewModel: ScreenViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack {
      header
      
      switch viewModel.loadingState {
      case .idle:
        idleView
      case .loading(let displayModel), .loaded(let displayModel):
        contentView
      case .failed(let screenError):
        errorView(screenError)
      }
      Spacer()
      footer
    }
    .onAppear() {
      viewModel.onAppear()
    }
  }
  
  @ViewBuilder
  func errorView(_ errorMessage: ScreenError) -> any View {
    Text("\(errorMessage)")
      .padding(20)
  }
  
  var idleView: some View {
    Text("Loading...")
      .padding(20)
  }
  
  var header: some View {
    Text("Header title")
      .font(.headline)
  }
  
  var contentView: some View {
    VStack {
      Text("Hello, World!!!!")
        .font(.body)
    }
    .padding(.top, 20)
  }
  
  var footer: some View {
    Text("footer here")
      .font(.caption)
  }
}
