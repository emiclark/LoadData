import SwiftUI

struct MainContentView: View {
  @ObservedObject var viewModel: MainScreenViewModel
  let displayModelItems: [MainDisplayModel]
  
  var body: some View {
    NavigationView {
      List {
        ForEach(displayModelItems, id: \.id) { item in
          Text(item.artistName)
            .foregroundColor(.black)
            .font(.subheadline)
            .padding(10)
        }
      }
      .listRowSeparator(.visible)
      .listStyle(.plain)
    }
    .padding(20)
    .background(Color.green)
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
      displayModel: MainDisplayModel(artistName: "artist name")
    )
  )
}

// old
//var body: some View {
//  NavigationView {
//    ScrollView(showsIndicators: true) {
//      List {
//        ForEach(displayModelItems, id: \.id) { item in
//          Text("Artist name: \(item.artistName)")
//            .foregroundColor(.black)
//            .font(.body)
//          
//          Text("Country: \(item.country)")
//          Text("Primary genre: \(item.primaryGenreName)")
//          Text("Description: \(String(describing: item.longDescription))")
//        }
//      }
//      .frame(maxWidth: .infinity, maxHeight: 500, alignment: .topLeading)
//      .listRowSeparator(.visible)
//      .listStyle(.plain)
//    }
//  }
//  .navigationTitle("Artists")
//  .padding(20)
//  .background(Color.green)
//}
