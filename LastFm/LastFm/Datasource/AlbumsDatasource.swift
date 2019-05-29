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
    
    class func requestTopHipHopAlbuns(musicGenre: String,
                                      success: @escaping (_ success: [Album]) -> Void,
                                      failure: @escaping (String) -> Void) {
        
        let queryItems = [URLQueryItem.init(name: Configurations.APP_ID_KEY, value: Configurations.APP_ID_VALUE),
                          URLQueryItem.init(name: METHOD_KEY, value: "tag.gettopalbums"),
                          URLQueryItem.init(name: TAG_KEY, value: musicGenre),
                          URLQueryItem.init(name: Configurations.FORMAT_KEY, value: Configurations.FORMAT_VALUE)]
        
        guard let urlComp = URLComponents(string: "https://ws.audioscrobbler.com/2.0/?method=tag.gettopalbums&tag=HipHop&api_key=e74bc5f2d42bd15af8b0aa7b54420aeb&format=json") else {
            failure("")
            return
        }
        
        //urlComp.queryItems = queryItems

       

//        let params = [Configurations.APP_ID_KEY : Configurations.APP_ID_VALUE,
//                      METHOD_KEY : "tag.gettopalbums",
//                      TAG_KEY : musicGenre,
//                      Configurations.FORMAT_KEY : Configurations.FORMAT_VALUE,
//        ]
//        
//        print(urlComp.url?.absoluteString)
        
        NetworkManager.requestURL(url: urlComp, parameters: [:], success: { response in
            do {
//                let string1 = String(data: response as! Data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
//                print(string1)
                
                let decoder = JSONDecoder()
                let albumsJSON = try decoder.decode(AlbumsResponse.self, from: response as! Data)
                success(albumsJSON.albums.album)
            } catch let jsonErr {
                print(jsonErr)
                failure("Error \(jsonErr)")
            }
        }) { (error) in
            failure("Error making request")
        }
    }
    
}
