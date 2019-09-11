//
//  ApiItunesClient.swift
//  bciPostulacion
//
//  Created by Sebastian Abarzua on 9/11/19.
//  Copyright © 2019 squierrelweb.net. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient: NSObject {
    
    override init() { super.init() }
    
    var session = URLSession.shared
    
    static func getMediaForTermAndMediaString(_ media: String, _ term: String?, completionHandlerFor_TermAndMediaString: @escaping (_ success: Bool, _ result: [iTunesResult]?, _ error: String?) -> Void)  {
        
        Alamofire.request(configureUrlSearchText(media, term)).responseJSON { response in
            
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    print("example success")
                default:
                    let errorMessage = "error with response status: \(status)"
                    completionHandlerFor_TermAndMediaString(false, nil, errorMessage)
                }
            }
        
            if let jsonObjectResult: Any = response.result.value {
                
                let jsonObjectResultDictionary = jsonObjectResult as! [String:AnyObject]
                
                debugPrint("🤜JSON TEXT SEARCH MEDIA: \(jsonObjectResult)") 
                
                if let results = jsonObjectResultDictionary["result"] {
                    
                    let resultsMediaTextSearch = iTunesResult.mediaFromResults(results as! [[String : AnyObject]])
                    
                    //test
                    debugPrint("🤾🏼‍♂️ TMDBMovie...\(resultsMediaTextSearch)")
                    
                    completionHandlerFor_TermAndMediaString(true, resultsMediaTextSearch, nil)
                    
                }
            }
        }
    }
    
    static func getArtworkImage(_ artworkUrl: String, _ completionHandlerForArtworkImage: @escaping ( _ imageData: Data?, _ error: String?) -> Void) {
        
        Alamofire.request(artworkUrl).responseData { response in
            
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    print("example success")
                default:
                    let errorMessage = "error with response status: \(status)"
                    completionHandlerForArtworkImage(nil, errorMessage)
                }
            }
            
            if let dataObjectResult: Any = response.result.value {
                
                let dataObjectResult = dataObjectResult as! Data
                
                completionHandlerForArtworkImage(dataObjectResult, nil)
                
                //test
                debugPrint("Los datos de la imagen: \(dataObjectResult)")
            }
        }
    }
    
    static func configureUrlSearchText(_ media: String, _ term: String?) -> URL {
        
        var components = URLComponents()
        components.scheme = ApiClient.Constants.ApiScheme
        components.host = ApiClient.Constants.ApiHost
        components.path = ApiClient.Constants.ApiPath
        components.queryItems = [URLQueryItem]()
        let queryItem1 = URLQueryItem(name: ApiClient.ParameterKeys.Media, value: media)
        let queryItem2 = URLQueryItem(name: ApiClient.ParameterKeys.StringSearch, value: term)
        components.queryItems?.append(queryItem1) // term
        components.queryItems?.append(queryItem2) // media
        
        return components.url!
    }
    
}
