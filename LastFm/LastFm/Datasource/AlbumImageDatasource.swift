//
//  AlbumImageDatasource.swift
//  LastFm
//
//  Created by Tiago Valente on 30/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

class AlbumImageDatasource {
    
    class func requestAlbumImage(albumImageName: String,
                                 success: @escaping (_ success: Data) -> Void,
                                 failure: @escaping (String) -> Void) {
        
        guard let urlComp = URLComponents(string: albumImageName) else {
            failure("Unable to create URL")
            return
        }
        
        NetworkManager.requestURL(url: urlComp, success: { response in
            success(response as! Data)
        }) { (error) in
            failure("Error making request")
        }
    }
    
}
