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
        MainContentView(
          viewModel: MainScreenViewModel(
            getArtistUseCase: GetArtistUseCase(
              getArtistRepository: GetArtistRepository(
                dataSource: GetArtistDataSource(
                  networkCall: NetworkCall(urlSession: URLSession()),
                  jsonDecoder: JSONDecoder()
                )
              )
            ),
            displayModel: viewModel.displayModel
          ),
          displayModelItems: viewModel.displayModelItems
        )
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
    Text("Artists")
      .font(.headline)
      .padding(20)
  }
}
