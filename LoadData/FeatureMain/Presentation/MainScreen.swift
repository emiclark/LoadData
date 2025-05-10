import SwiftUI

struct MainScreen: View {
  @ObservedObject var viewModel: MainScreenViewModel
  
  init(viewModel: MainScreenViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack {
      header
      
      switch viewModel.loadingState {
      case .idle:
        MainIdleView()
      case .loading:
        MainLoadingView()
      case .loaded:
        MainContentView(quote: viewModel.displayModel.quote, author: viewModel.displayModel.author, category: viewModel.displayModel.category)
      case .failed(let error):
        MainErrorView(error: error)
      }
      
      Spacer()
      Button("Refresh loading state") {
        Task {
          await viewModel.onAppear()
        }
      }
    }
        .task {
          await viewModel.onAppear()
        }
  }
  
  var header: some View {
    Text("A quote for \(viewModel.displayModel.category)")
      .font(.headline)
      .padding(20)
  }
}
