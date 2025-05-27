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
                artistName: "artist name",
                kind: Kind.featureMovie,
                wrapperType: WrapperType.track,
                country: Country.usa
              )
            )
          )
      }
    }
}
