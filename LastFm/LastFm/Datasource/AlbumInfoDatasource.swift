//
//  AlbumInfoDatasource.swift
//  LastFm
//
//  Created by Tiago Valente on 29/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

class AlbumInfoDatasource {
    
    static private let METHOD_KEY = "method"
    static private let TAG_KEY = "tag"
    static private let LIMIT_KEY = "limit"
    
    class func requestAlbumInfo(artistName: String,
                                albumName: String,
                                success: @escaping (_ success: Album) -> Void,
                                failure: @escaping (String) -> Void) {
        
        guard let urlComp = URLComponents(string: "https://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=e74bc5f2d42bd15af8b0aa7b54420aeb&artist=CalvinHarris&album=FunkWavBouncesVol.1&format=json") else {
            failure("")
            return
        }
        
        NetworkManager.requestURL(url: urlComp, parameters: [:], success: { response in
            do {
                let string1 = String(data: response as! Data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                print(string1)
                
                let decoder = JSONDecoder()
                let albumsJSON = try decoder.decode(AlbumInfoResponse.self, from: response as! Data)
                success(albumsJSON.album)
            } catch let jsonErr {
                print(jsonErr)
                failure("Error \(jsonErr)")
            }
        }) { (error) in
            failure("Error making request")
        }
    }
    
}
