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
        
        guard let urlComp = URLComponents(string: Configurations.endpoint) else {
            failure("")
            return
        }
        
        let params = [Configurations.APP_ID_KEY : Configurations.APP_ID_VALUE,
                      METHOD_KEY : "tag.gettopalbums",
                      TAG_KEY : musicGenre,
                      Configurations.FORMAT_KEY : Configurations.FORMAT_VALUE,
        ]
        
        NetworkManager.requestURL(url: urlComp, parameters: params, success: { (response) in
            do {
                let decoder = JSONDecoder()
                let albumsJSON = try decoder.decode(Albums.self, from: response as! Data)
                success(albumsJSON.albums)
            } catch let jsonErr {
                failure("Error \(jsonErr)")
            }
        }) { (error) in
            failure("Error making request")
        }
    }
    
}
