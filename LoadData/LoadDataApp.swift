import SwiftUI

@main
struct TestGitApp: App {
    var body: some Scene {
        WindowGroup {
          MainScreen(
            viewModel: MainScreenViewModel(
              getArtistUseCase: GetArtistUseCase(
                getArtistRepository: GetArtistRepository(
                  dataSource: GetArtistDataSource(
                    networkCall: NetworkCall(urlSession: URLSession.shared),
                    jsonDecoder: JSONDecoder()
                  )
                )
              ),
              displayModel: MainDisplayModel(
//                kind: Kind.featureMovie,
//                artistID: 001,
//                collectionID: 0011,
//                trackID: 111,
                artistName: "artist name"
//                collectionName: "collection name",
//                trackName: "Track name",
//                country: Country.usa,
//                primaryGenreName: "primary genre name",
//                shortDescription: "short description",
//                longDescription: "long description",
//                collectionArtistName: "collection artist name"
              )
            )
        )
      }
    }
}
