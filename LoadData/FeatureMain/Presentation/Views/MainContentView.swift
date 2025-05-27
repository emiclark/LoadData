import SwiftUI

struct MainContentView: View {
  @ObservedObject var viewModel: MainScreenViewModel
  let displayModelItems: [MainDisplayModel]
  
  var body: some View {
    List {
      ForEach(displayModelItems, id: \.id) { item in
        NavigationLink {
          MainContentDetailView(item: item)
        } label: {
          Text(item.artistName)
        }
      }
    }
    .listRowSeparator(.visible)
    .listStyle(.plain)
    .padding(6)
  }
}

#Preview {
  MainScreen(
    viewModel: MainScreenViewModel(
      getArtistUseCase: GetArtistUseCase(
        getArtistRepository: GetArtistRepository(
          dataSource: GetArtistDataSource(
            networkCall: NetworkCall(urlSession: URLSession()),
            jsonDecoder: JSONDecoder()
          )
        )
      ),
      displayModel: MainDisplayModel(
        artistName: "Artist name",
        kind: .featureMovie,
        wrapperType: .track,
        country: .usa
      )
    )
  )
}
