//
//  AlbumsDatasource.swift
//  LastFm
//
//  Created by Tiago Valente on 28/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

class AlbumsDatasource {
    
    static private let METHOD_KEY = "method"
    static private let TAG_KEY = "tag"
    static private let LIMIT_KEY = "limit"
    
    class func requestTopAlbuns(musicGenre: String,
                                success: @escaping (_ success: [Album]) -> Void,
                                failure: @escaping (String) -> Void) {
        
        let queryItems = [URLQueryItem.init(name: Configurations.API_KEY, value: Configurations.API_KEY_VALUE),
                          URLQueryItem.init(name: METHOD_KEY, value: "tag.gettopalbums"),
                          URLQueryItem.init(name: TAG_KEY, value: musicGenre),
                          URLQueryItem.init(name: Configurations.FORMAT_KEY, value: Configurations.FORMAT_VALUE),
                          URLQueryItem.init(name: LIMIT_KEY, value: "100")]
        
        guard var urlComp = URLComponents(string: Configurations.endpoint) else {
            failure("Unable to create URL")
            return
        }
        urlComp.queryItems = queryItems
        
        NetworkManager.requestURL(url: urlComp, parameters: [:], success: { response in
            do {
                let decoder = JSONDecoder()
                let albumsJSON = try decoder.decode(AlbumsResponse.self, from: response as! Data)
                success(albumsJSON.albums.album)
            } catch _ {
                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorResponse.self, from: response as! Data)
                    failure(error.message)
                } catch let jsonErr {
                    failure("Error \(jsonErr)")
                }
            }
        }) { (error) in
            failure("Error making request")
        }
    }
    
}
