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
    var onAlbumSelectionEvent: ((Album)->Void)?
    
    func fetchData() {
        
        AlbumsDatasource.requestTopAlbuns(musicGenre: musicGenre, success: { [weak self] result in

            self?.albumList = result
            self?.loadViews()

        }) { [weak self] error in
            self?.albumList = []
            self?.loadViews()
        }
    }
    
    func loadViews() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
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
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        cell.imageView?.image = nil
        cell.textLabel?.text = albumList[indexPath.row].name
        
        if let imageValue = albumList[indexPath.row].image.first?.text, let imageURL = URLComponents(string: imageValue) {
            NetworkManager.requestURL(url: imageURL, success: { (dataResult) in
                DispatchQueue.main.async() {
                    cell.imageView?.image = UIImage(data: dataResult as! Data)
                    cell.setNeedsLayout()
                }
            }) { (error) in
                print(error)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onAlbumSelectionEvent?(albumList[indexPath.row])
    }
}

extension AlbumViewCell {
    
    
}
