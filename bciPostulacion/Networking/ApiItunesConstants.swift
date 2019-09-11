//
//  ApiItunesConstants.swift
//  bciPostulacion
//
//  Created by Sebastian Abarzua on 9/11/19.
//  Copyright © 2019 squierrelweb.net. All rights reserved.
//

import Foundation


extension ApiClient {
    
    struct Constants {
        static let ApiPathIni = "https://itunes.apple.com/search?term="
        static let ApiPathEnd = "&mediaType=music&limit=20"
     }
    
    struct JSONResponseKeys {
        static let TrackName = "trackName"
        static let LongDescription = "longDescription"
        static let ArtworkUrl = "artworkUrl100"
        static let ArtistName = "artistName"
        static let PreviewUrl = "previewUrl"
    }
}
