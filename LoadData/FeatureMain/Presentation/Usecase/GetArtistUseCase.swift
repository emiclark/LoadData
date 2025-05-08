import Foundation

class GetArtistUseCase {
  private let getArtistRepository: GetArtistRepository
  
  init(getArtistRepository: GetArtistRepository) {
    self.getArtistRepository = getArtistRepository
  }
  
  func getArtist() async throws -> ArtistModel {
    let entity = try await getArtistRepository.getArtist()
    return map(from: entity)
  }
  
  func map(from entity: ArtistEntity) -> ArtistModel {
    ArtistModel(artists: entity.artists
    )
  }
}
      
// ===
//ArtistModel(
//  artist: entity.artists
  //      wrapperType: entity.wrapperType,
  //      kind: entity.kind,
  //      collectionId: entity.collectionId,
  //      trackId: entity.trackId,
  //      artistName: entity.artistName,
  //      collectionName: entity.collectionName,
  //      trackName: entity.trackName,
  //      collectionCensoredName: entity.collectionCensoredName,
  //      trackCensoredName: entity.trackCensoredName,
  //      collectionArtistId: entity.collectionArtistId,
  //      collectionArtistViewUrl: entity.collectionArtistViewUrl,
  //      collectionViewUrl: entity.collectionViewUrl,
  //      trackViewUrl: entity.trackViewUrl,
  //      previewUrl: entity.previewUrl,
  //      artworkUrl30: entity.artworkUrl30,
  //      artworkUrl60: entity.artworkUrl60,
  //      artworkUrl100: entity.artworkUrl100,
  //      collectionPrice: entity.collectionPrice,
  //      trackPrice: entity.trackPrice,
  //      trackRentalPrice: entity.trackRentalPrice,
  //      collectionHdPrice: entity.collectionHdPrice,
  //      trackHdPrice: entity.trackHdPrice,
  //      trackHdRentalPrice: entity.trackHdRentalPrice,
  //      releaseDate: entity.releaseDate,
  //      collectionExplicitness: entity.collectionExplicitness,
  //      trackExplicitness: entity.trackExplicitness,
  //      discCount: entity.discCount,
  //      discNumber: entity.discNumber,
  //      trackCount: entity.trackCount,
  //      trackNumber: entity.trackNumber,
  //      trackTimeMillis: entity.trackTimeMillis,
  //      country: entity.country,
  //      currency: entity.currency,
  //      primaryGenreName: entity.primaryGenreName,
  //      contentAdvisoryRating: entity.contentAdvisoryRating,
  //      shortDescription: entity.shortDescription,
  //      longDescription: entity.longDescription,
  //      hasITunesExtras: entity.hasITunesExtras
//)
