import SwiftUI

@main
struct TestGitApp: App {
    var body: some Scene {
        WindowGroup {
          Screen(viewModel: ScreenViewModel())
        }
    }
}
