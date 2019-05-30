//
//  ArtistInfoDatasource.swift
//  LastFm
//
//  Created by Tiago Valente on 30/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

class ArtistInfoDatasource {
        
    static private let METHOD_KEY = "method"
    static private let ARTIST_KEY = "artist"
    static private let ALBUM_KEY = "album"
    
    class func requestArtistInfo(artistName: String,
                                success: @escaping (_ success: ArtistInfoResponseArtist) -> Void,
                                failure: @escaping (String) -> Void) {
        
        let queryItems = [URLQueryItem.init(name: Configurations.API_KEY, value: Configurations.API_KEY_VALUE),
                          URLQueryItem.init(name: METHOD_KEY, value: "artist.getinfo"),
                          URLQueryItem.init(name: ARTIST_KEY, value: artistName),
                          URLQueryItem.init(name: Configurations.FORMAT_KEY, value: Configurations.FORMAT_VALUE)]
        
        guard var urlComp = URLComponents(string: Configurations.endpoint) else {
            failure("Unable to create URL")
            return
        }
        urlComp.queryItems = queryItems
        
        NetworkManager.requestURL(url: urlComp, success: { response in
            do {
                let string1 = String(data: response as! Data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                print(string1)

                let decoder = JSONDecoder()
                let artistInfoJSON = try decoder.decode(ArtistInfoResponse.self, from: response as! Data)
                success(artistInfoJSON.artist)
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
