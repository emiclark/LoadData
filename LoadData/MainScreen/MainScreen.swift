import SwiftUI

struct MainScreen: View {
  @ObservedObject var viewModel: MainScreenViewModel
  
  init(viewModel: MainScreenViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack {
      header
      Spacer()
      
      switch viewModel.loadingState {
      case .idle:
        MainIdleView()
      case .loading:
        MainLoadingView()
      case .loaded:
        MainContentView()
      case .failed(let error):
        MainErrorView(error: error)
      }
      
      Spacer()
      Button("Refresh loading state") {
        Task {
          await viewModel.onAppear()
        }
      }
      footer
    }
//    .task {
//      await viewModel.onAppear()
//    }
  }
  
  var header: some View {
    Text("Header title")
      .font(.headline)
      .padding(20)
  }
  
  var footer: some View {
    Text("footer here")
      .font(.caption)
      .padding(20)
  }
}
