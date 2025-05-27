import Foundation

struct ArtistData: Decodable {
  let results: [Artist]
}

struct Artist: Decodable {
  let artistName: String
  let wrapperType: WrapperType
  let country: Country
  let kind: Kind
}

enum WrapperType: String, Codable {
  case track = "track"
}

enum Country: String, Codable {
  case usa = "USA"
}

enum Kind: String, Codable {
  case featureMovie = "feature-movie"
  case song = "song"
}


//struct Artist2: Decodable { // original full response from app.quicktype.io
//  let wrapperType: WrapperType
//  let kind: Kind
//  let artistID: Int?
//  let collectionID: Int?
//  let trackID: Int
//  let artistName: String
//  let collectionName: String?
//  let trackName: String
//  let collectionCensoredName: String?
//  let trackCensoredName: String
//  let collectionArtistID: Int?
//  let collectionArtistViewURL, collectionViewURL: String?
//  let trackViewURL: String
//  let previewURL: String
//  let artworkUrl30, artworkUrl60, artworkUrl100: String
//  let collectionPrice, trackPrice: Double
//  let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
//  let releaseDate: Date
//  let collectionExplicitness, trackExplicitness: Explicitness
//  let discCount, discNumber, trackCount, trackNumber: Int?
//  let trackTimeMillis: Int
//  let country: Country
//  let currency: Currency
//  let primaryGenreName: String
//  let contentAdvisoryRating, shortDescription, longDescription: String?
//  let hasITunesExtras: Bool?
//  let artistViewURL: String?
//  let isStreamable: Bool?
//  let collectionArtistName: String?
//  
//  enum CodingKeys: String, CodingKey {
//    case wrapperType, kind
//    case collectionID = "collectionId"
//    case trackID = "trackId"
//    case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
//    case collectionArtistID = "collectionArtistId"
//    case collectionArtistViewURL = "collectionArtistViewUrl"
//    case collectionViewURL = "collectionViewUrl"
//    case trackViewURL = "trackViewUrl"
//    case previewURL = "previewUrl"
//    case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
//    case collectionHDPrice = "collectionHdPrice"
//    case trackHDPrice = "trackHdPrice"
//    case trackHDRentalPrice = "trackHdRentalPrice"
//    case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
//    case artistID = "artistId"
//    case artistViewURL = "artistViewUrl"
//    case isStreamable, collectionArtistName
//  }
//}
//
//enum Explicitness: String, Codable {
//  case explicit = "explicit"
//  case notExplicit = "notExplicit"
//}
//
//enum Country: String, Codable {
//  case usa = "USA"
//}
//
//enum Currency: String, Codable {
//  case usd = "USD"
//}
//
//enum Kind: String, Codable {
//  case featureMovie = "feature-movie"
//  case song = "song"
//}
//
//enum WrapperType: String, Codable {
//  case track = "track"
//}

/* app.quicktype.io output
 
 struct iTunesData {
 let resultCount: Int
 let results: [Artist]
 }
 
 struct Artist: Decodable {
 let wrapperType: WrapperType
 let kind: Kind
 let collectionID: Int?
 let trackID: Int
 let artistName: String
 let collectionName: String?
 let trackName: String
 let collectionCensoredName: String?
 let trackCensoredName: String
 let collectionArtistID: Int?
 let collectionArtistViewURL, collectionViewURL: String?
 let trackViewURL: String
 let previewURL: String
 let artworkUrl30, artworkUrl60, artworkUrl100: String
 let collectionPrice, trackPrice: Double
 let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
 let releaseDate: Date
 let collectionExplicitness, trackExplicitness: Explicitness
 let discCount, discNumber, trackCount, trackNumber: Int?
 let trackTimeMillis: Int
 let country: Country
 let currency: Currency
 let primaryGenreName: String
 let contentAdvisoryRating, shortDescription, longDescription: String?
 let hasITunesExtras: Bool?
 let artistID: Int?
 let artistViewURL: String?
 let isStreamable: Bool?
 let collectionArtistName: String?
 
 enum CodingKeys: String, CodingKey {
 case wrapperType, kind
 case collectionID = "collectionId"
 case trackID = "trackId"
 case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
 case collectionArtistID = "collectionArtistId"
 case collectionArtistViewURL = "collectionArtistViewUrl"
 case collectionViewURL = "collectionViewUrl"
 case trackViewURL = "trackViewUrl"
 case previewURL = "previewUrl"
 case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
 case collectionHDPrice = "collectionHdPrice"
 case trackHDPrice = "trackHdPrice"
 case trackHDRentalPrice = "trackHdRentalPrice"
 case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
 case artistID = "artistId"
 case artistViewURL = "artistViewUrl"
 case isStreamable, collectionArtistName
 }
 }
 
 enum Explicitness: String, Codable {
 case explicit = "explicit"
 case notExplicit = "notExplicit"
 }
 
 enum Country: String, Codable {
 case usa = "USA"
 }
 
 enum Currency: String, Codable {
 case usd = "USD"
 }
 
 enum Kind: String, Codable {
 case featureMovie = "feature-movie"
 case song = "song"
 }
 
 enum WrapperType: String, Codable {
 case track = "track"
 }
*/


/* sample json
{
  "resultCount": 28,
  "results": [
    {
    "wrapperType": "track",
    "kind": "feature-movie",
    "collectionId": 1502173677,
    "trackId": 1315255745,
    "artistName": "Jake Kasdan",
    "collectionName": "JUMANJI : COLLECTION DE 2 FILMS",
    "trackName": "Jumanji: Welcome to the Jungle",
    "collectionCensoredName": "Jumanji: 2 Film Bundle",
    "trackCensoredName": "Jumanji: Welcome to the Jungle",
    "collectionArtistId": 345346702,
    "collectionArtistViewUrl": "https://itunes.apple.com/us/artist/sony-pictures-entertainment/345346702?uo=4",
    "collectionViewUrl": "https://itunes.apple.com/us/movie/jumanji-welcome-to-the-jungle/id1315255745?uo=4",
    "trackViewUrl": "https://itunes.apple.com/us/movie/jumanji-welcome-to-the-jungle/id1315255745?uo=4",
    "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video118/v4/42/b9/a0/42b9a0b1-60e4-86c0-36b3-915522d45765/mzvf_172183937853883111.640x354.h264lc.U.p.m4v",
    "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Video125/v4/21/0b/4a/210b4a1c-0de6-3a03-27a5-408948f7f173/pr_source.lsr/30x30bb.jpg",
    "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Video125/v4/21/0b/4a/210b4a1c-0de6-3a03-27a5-408948f7f173/pr_source.lsr/60x60bb.jpg",
    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Video125/v4/21/0b/4a/210b4a1c-0de6-3a03-27a5-408948f7f173/pr_source.lsr/100x100bb.jpg",
    "collectionPrice": 14.99,
    "trackPrice": 14.99,
    "trackRentalPrice": 3.99,
    "collectionHdPrice": 14.99,
    "trackHdPrice": 14.99,
    "trackHdRentalPrice": 3.99,
    "releaseDate": "2017-12-20T08:00:00Z",
    "collectionExplicitness": "notExplicit",
    "trackExplicitness": "notExplicit",
    "discCount": 1,
    "discNumber": 1,
    "trackCount": 2,
    "trackNumber": 1,
    "trackTimeMillis": 7154613,
    "country": "USA",
    "currency": "USD",
    "primaryGenreName": "Action & Adventure",
    "contentAdvisoryRating": "PG-13",
    "shortDescription": "Four teenagers in detention discover an old video console with a game they’ve never heard of. When",
    "longDescription": "Four teenagers in detention discover an old video console with a game they’ve never heard of. When they decide to play, they are immediately sucked into the jungle world of Jumanji in the bodies of their avatars (Dwayne Johnson, Jack Black, Kevin Hart, and Karen Gillan). They’ll have to complete the adventure of their lives filled with fun, thrills and danger or be stuck in the game forever!",
    "hasITunesExtras": true
    }
  ]
}
 */
