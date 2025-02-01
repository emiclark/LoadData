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
      case .loading(let displayModel):
        isLoadingView
      case .loaded(let displayModel):
        contentView
      case .failed(let error):
        VStack {
          Text("\(error.localizedDescription)")
        }
        .padding(20)
        .frame(width: 300, height: 400)
        .foregroundColor(.white)
        .background(Color.red)
      }
      
      Spacer()
      Button("Refresh loading state") {
        Task {
          try! await viewModel.loadData()
        }
      }
      footer
    }
  }
  
  @ViewBuilder
  func errorView(_ errorMessage: ScreenViewModel.ScreenError) -> any View {
    VStack {
      Text("\(errorMessage.localizedDescription)")
    }
    .padding(20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.red)
  }
  
  var idleView: some View {
    VStack {
      Text("Idle... 😴 ")
    }
    .padding(20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.gray)
  }
  
  var isLoadingView: some View {
    VStack {
      Text("Loading...")
    }
    .padding(20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.yellow)
  }
  
  var header: some View {
    Text("Header title")
      .font(.headline)
      .padding(20)
  }
  
  var contentView: some View {
    VStack {
      Text("Hello, World!!!!")
    }
    .font(.body)
    .padding(.top, 20)
    .frame(width: 300, height: 400)
    .foregroundColor(.white)
    .background(Color.green)
  }
  
  var footer: some View {
    Text("footer here")
      .font(.caption)
      .padding(20)
  }
}
