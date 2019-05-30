//
//  AlbumDetailViewModel.swift
//  LastFm
//
//  Created by Tiago Valente on 30/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//
import Foundation
import UIKit

class AlbumDetailViewModel {
    
    var albumImage: UIImageView?
    var albumNameLabel: UILabel?
    var albumNumberTracksLabel: UILabel?
    var albumPublishDateLabel: UILabel?
    
    var artistNameLabel: UILabel?
    var artistListenersLabel: UILabel?
    
    var selectedAlbum: Album?
    var albumInfo: AlbumInfo?
    var artistInfo: ArtistInfoResponseArtist?
    
    func fetchData() {
        
        AlbumInfoDatasource.requestAlbumInfo(artistName: selectedAlbum?.artist?.name ?? "", albumName: selectedAlbum?.name ?? "", success: { [weak self] result in

            self?.albumInfo = result

            ArtistInfoDatasource.requestArtistInfo(artistName: self?.selectedAlbum?.artist?.name ?? "", success: { [weak self] response in
                self?.artistInfo = response
                self?.loadViews()
            }, failure: { error in
                self?.loadViews()
            })
        }) { error in
            self.loadViews()
        }
    }
    
    func loadViews() {
        DispatchQueue.main.async { [weak self] in
            
            if let album = self?.albumInfo {
                let filteredImage = album.image.filter( {$0.size == "large" }).map({ return $0.text })
                if let imageLarge = filteredImage.first {
                    AlbumImageDatasource.requestAlbumImage(albumImageName: imageLarge, success: { [weak self] result in
                        DispatchQueue.main.async() {
                            self?.albumImage?.image = UIImage.init(data: result)
                        }
                    }, failure: { error in
                        print(error)
                    })
                }
                self?.albumNameLabel?.text = String(format: Strings.albumNameString, album.name)
                self?.albumNumberTracksLabel?.text = String(format: Strings.albumTracksString, String(album.tracks.track.count))
                self?.albumPublishDateLabel?.text = String(format: Strings.albumPublishDateString, album.wiki?.published ?? "N/A")
                self?.artistNameLabel?.text = String(format: Strings.artistNameString, album.artist)
            }
            
            if let listeners = self?.artistInfo?.stats.listeners {
                self?.artistListenersLabel?.text = String(format: Strings.artistListenersString, listeners)
            }
        }
    }
    
}
