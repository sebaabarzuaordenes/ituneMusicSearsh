//
//  ResultItunes.swift
//  bciPostulacion
//
//  Created by Sebastian Abarzua on 9/11/19.
//  Copyright © 2019 squierrelweb.net. All rights reserved.
//

import Foundation

struct iTunesResult {
    
    let songTitle: String?
    let songNameArtis: String?
    let songArtwork: String?
    let songPlay: String?
    
    init(dictionary: [String:AnyObject]) {
        
        songTitle = dictionary[ApiClient.JSONResponseKeys.TrackName] as? String
        songNameArtis = dictionary[ApiClient.JSONResponseKeys.ArtistName] as? String
        songArtwork = dictionary[ApiClient.JSONResponseKeys.ArtworkUrl] as? String
        songPlay = dictionary[ApiClient.JSONResponseKeys.PreviewUrl] as? String
    }
    
    static func formResult(_ fomrResult: [[String:AnyObject]]) -> [ApiClient] {
        var resultArray = [ApiClient]()
        
        for result in resultArray{
            resultArray.append(ApiClient(dictionary: result))
        }
        return resultArray
    }
}
