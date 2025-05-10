import SwiftUI

@main
struct TestGitApp: App {
    var body: some Scene {
        WindowGroup {
          MainScreen(
            viewModel: MainScreenViewModel(
              getQuoteUseCase: GetQuoteUseCase(
                getQuoteRepository: GetQuoteRepository(
                  dataSource: GetQuoteDataSource(
                    networkCall: NetworkCall(urlSession: URLSession.shared),
                    jsonDecoder: JSONDecoder()
                  )
                )
              ),
              displayModel: MainDisplayModel(quote: "aQuote", author: "aAuthor", category: "aCategory")
            )
          )
        }
    }
}
