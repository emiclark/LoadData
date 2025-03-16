import SwiftUI

@main
struct TestGitApp: App {
    var body: some Scene {
        WindowGroup {
          MainScreen(
            viewModel: MainScreenViewModel(
              getQuoteUseCase: GetQuoteUseCase(
                getQuoteRepository: GetQuoteRepository(
                  dataSource: GetQuoteDataSource()
                )
              ),
              displayModel: MainDisplayModel(quote: "aQuote", author: "aAuthor", category: "aCategory")
            )
          )
        }
    }
}
