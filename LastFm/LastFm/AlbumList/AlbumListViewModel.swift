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
    
    let musicGenre = "Hip Hop"
    
    let cellIdentifier = NSStringFromClass(AlbumViewCell.classForCoder())
    var tableView: UITableView? {
        didSet {
            tableView?.register(AlbumViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
            tableView?.dataSource = self
            tableView?.delegate = self
            tableView?.separatorStyle = .none
            tableView?.rowHeight = UITableView.automaticDimension
            tableView?.estimatedRowHeight = 200
        }
    }
    
    var albumList: [Album] = []
    var albumsViewModel: [Int: AlbumCellViewModel] = [:]
    var onOrderSelectionEvent: ((Album)->Void)?
    
    func fetchData() {
        AlbumsDatasource.requestTopHipHopAlbuns(musicGenre: musicGenre, success: { [weak self] result in
            
            self?.albumList = result
            self?.loadViews()
            
        }) { error in
            self.loadViews()
        }
    }
    
    func loadViews() {
        
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AlbumViewCell, albumList.count > indexPath.row {
            
            var cellViewModel = albumsViewModel[indexPath.row]
            if cellViewModel == nil {
                //cellViewModel = AlbumViewCell.init(dataSource: dataSource)
                albumsViewModel[indexPath.row] = cellViewModel
            }
            
            cellViewModel?.populateCell(cell, withAlbum: albumList[indexPath.row])
            cellViewModel?.onOrderSelectionEvent = { [weak self] order in
                self?.onOrderSelectionEvent?(order)
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
}
