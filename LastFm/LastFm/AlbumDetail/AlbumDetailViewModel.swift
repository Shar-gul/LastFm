//
//  AlbumDetailViewModel.swift
//  LastFm
//
//  Created by Tiago Valente on 30/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

class AlbumDetailViewModel {
    
    
    
    func fetchData() {
        
        AlbumInfoDatasource.requestAlbumInfo(artistName: "Far East Movement", albumName: "Free Wired", success: { [weak self] result in
            self?.loadViews()
        }) { error in
            self.loadViews()
        }
    }
    
    func loadViews() {
        
        
        
    }
    
}
