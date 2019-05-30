//
//  AlbumListViewModel.swift
//  LastFm
//
//  Created by Tiago Valente on 28/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation
import UIKit

class AlbumListViewModel: NSObject {
    
    let cellIdentifier = "cell"
    var tableView: UITableView? {
        didSet {
            tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
            tableView?.dataSource = self
            tableView?.delegate = self
            tableView?.separatorStyle = .none
            tableView?.rowHeight = UITableView.automaticDimension
            tableView?.estimatedRowHeight = 200
        }
    }
    
    var albumList: [Album] = []
    var onAlbumSelectionEvent: ((Album)->Void)?
    
    func fetchData() {
        
        AlbumsDatasource.requestTopAlbuns(musicGenre: Configurations.MUSIC_GENRE, success: { [weak self] result in

            self?.albumList = result
            self?.loadViews()

        }) { [weak self] error in
            self?.albumList = []
            self?.loadViews()
        }
    }
    
    func loadViews() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }
}

extension AlbumListViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            
        cell.imageView?.image = nil
        cell.textLabel?.text = albumList[indexPath.row].name
        
        if let imageValue = albumList[indexPath.row].image.first?.text {
            
            AlbumImageDatasource.requestAlbumImage(albumImageName: imageValue, success: { result in
                DispatchQueue.main.async() {
                    cell.imageView?.image = UIImage(data: result)
                    cell.setNeedsLayout()
                }
            }) { error in
                print(error)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onAlbumSelectionEvent?(albumList[indexPath.row])
    }
}
