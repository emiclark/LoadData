import Foundation

class GetArtistRepository {
  let dataSource: GetArtistDataSource
  
  init(dataSource: GetArtistDataSource) {
    self.dataSource = dataSource
  }
  
  func getArtist() async throws -> ArtistEntity {
    let entity = try await dataSource.getArtist()
    return try map(from: entity)
  }
  
  func map(from data: ArtistData) throws -> ArtistEntity {
    return ArtistEntity(artists: data.results)
  }
}

//
//func map(from data: ArtistData) throws -> [ArtistEntity] {
//  return ArtistEntity(
//      wrapperType: source.wrapperType,
//      kind: source.kind,
//      collectionId: source.collectionId,
//      trackId: source.trackId,
//      artistName: source.artistName,
//      collectionName: source.collectionName,
//      trackName: source.trackName,
//      collectionCensoredName: source.collectionCensoredName,
//      trackCensoredName: source.trackCensoredName,
//      collectionArtistId: source.collectionArtistId,
//      collectionArtistViewUrl: source.collectionArtistViewUrl,
//      collectionViewUrl: source.collectionViewUrl,
//      trackViewUrl: source.trackViewUrl,
//      previewUrl: source.previewUrl,
//      artworkUrl30: source.artworkUrl30,
//      artworkUrl60: source.artworkUrl60,
//      artworkUrl100: source.artworkUrl100,
//      collectionPrice: source.collectionPrice,
//      trackPrice: source.trackPrice,
//      trackRentalPrice: source.trackRentalPrice,
//      collectionHdPrice: source.collectionHdPrice,
//      trackHdPrice: source.trackHdPrice,
//      trackHdRentalPrice: source.trackHdRentalPrice,
//      releaseDate: source.releaseDate,
//      collectionExplicitness: source.collectionExplicitness,
//      trackExplicitness: source.trackExplicitness,
//      discCount: source.discCount,
//      discNumber: source.discNumber,
//      trackCount: source.trackCount,
//      trackNumber: source.trackNumber,
//      trackTimeMillis: source.trackTimeMillis,
//      country: source.country,
//      currency: source.currency,
//      primaryGenreName: source.primaryGenreName,
//      contentAdvisoryRating: source.contentAdvisoryRating,
//      shortDescription: source.shortDescription,
//      longDescription: source.longDescription,
//      hasITunesExtras: source.hasITunesExtras
//  )
//}
