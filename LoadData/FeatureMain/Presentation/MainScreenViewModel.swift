import Foundation
import SwiftUI

class MainScreenViewModel: ObservableObject {
  @Published var loadingState: LoadingState<MainDisplayModel> = .idle
  @Published var displayModel: MainDisplayModel
  var displayModelItems: [MainDisplayModel] = []
  
  private let getArtistUseCase: GetArtistUseCase
  
  init(
    getArtistUseCase: GetArtistUseCase,
    displayModel: MainDisplayModel
  ) {
    self.getArtistUseCase = getArtistUseCase
    self.displayModel = displayModel
  }
  
  func onAppear() async {
    try? await loadData()
  }
}

@MainActor
private extension MainScreenViewModel {
  func loadData() async throws {
    loadingState = .loading(displayModel)

    do {
      let model = try await getArtistUseCase.getArtist()
      displayModelItems = try map(from: model)
      loadingState = .loaded(displayModel)
    } catch is MainScreenViewModel.MainScreenError {
      loadingState = .failed(MainScreenViewModel.MainScreenError.mappingError)
    } catch let error {
      throw error
    }
  }
}

extension MainScreenViewModel {
  func map(from source: ArtistModel) throws -> [MainDisplayModel] {
    var displayModelItems: [MainDisplayModel] = []
    
    for artist in source.artists {
      let mainDisplayModel = MainDisplayModel(
        artistName: artist.artistName,
        kind: artist.kind,
        wrapperType: artist.wrapperType,
        country: artist.country
      )
      displayModelItems.append(mainDisplayModel)
    }
    return displayModelItems
  }
}

extension MainScreenViewModel {
  enum LoadingState<MainDisplayModelItems> {
    case idle
    case loading(MainDisplayModelItems)
    case loaded(MainDisplayModelItems)
    case failed(MainScreenError)
  }

  enum MainScreenError: Error, CustomStringConvertible {
    case networkError
    case mappingError
    
    var description: String {
      switch self {
      case .networkError:
        return "Network error"
      case .mappingError:
        return "Mapping error"
      }
    }
  }
}


// old
//extension MainScreenViewModel {
//  func map(from source: ArtistModel) throws -> [MainDisplayModel] {
//    var displayModelItems: [MainDisplayModel] = []
//    
//    for artist in source.artists {
//      let mainDisplayModel = MainDisplayModel(
//        kind: artist.kind,
//        artistID: artist.artistID,
//        collectionID: artist.collectionID,
//        trackID: artist.trackID,
//        artistName: artist.artistName,
//        collectionName: artist.collectionName,
//        trackName: artist.trackName,
//        country: artist.country,
//        primaryGenreName: artist.primaryGenreName,
//        shortDescription: artist.shortDescription,
//        longDescription: artist.longDescription,
//        collectionArtistName: artist.collectionName
//      )
//      displayModelItems.append(mainDisplayModel)
//    }
//    return displayModelItems
//  }
//}
