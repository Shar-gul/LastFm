//
//  AlbumDetailViewController.swift
//  LastFm
//
//  Created by Tiago Valente on 30/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    var albumImage: UIImageView = UIImageView.init()
    var albumNameLabel: UILabel = UILabel.init()
    var albumNumberTracksLabel: UILabel = UILabel.init()
    var albumPublishDateLabel: UILabel = UILabel.init()
    
    var artistNameLabel: UILabel = UILabel.init()
    var artistListeners: UILabel = UILabel.init()
    
    var viewModel: AlbumDetailViewModel
    
    init() {
        self.viewModel = AlbumDetailViewModel.init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumImage)
        let albumImageTopConstraint = albumImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        let albumImageCenterXConstraint = albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let albumImageWidthConstraint = albumImage.widthAnchor.constraint(equalToConstant: 250)
        let albumImageHeightConstraint = albumImage.heightAnchor.constraint(equalToConstant: 250)
        
        view.addConstraints([albumImageTopConstraint, albumImageCenterXConstraint, albumImageWidthConstraint, albumImageHeightConstraint])
        
        albumNameLabel.text = "Album Label"
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumNameLabel)
        let albumNameLabelTopConstraint = albumNameLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30)
        let albumNameLabelLeadingConstraint = albumNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let albumNameLabelTrailingConstraint = albumNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let albumNameLabelHeightConstraint = albumNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        
        view.addConstraints([albumNameLabelTopConstraint, albumNameLabelLeadingConstraint, albumNameLabelTrailingConstraint, albumNameLabelHeightConstraint])
        
        albumNumberTracksLabel.text = "Album Tracks"
        albumNumberTracksLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumNumberTracksLabel)
        let albumNumberTracksLabelTopConstraint = albumNumberTracksLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 30)
        let albumNumberTracksLabelLeadingConstraint = albumNumberTracksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let albumNumberTracksLabelTrailingConstraint = albumNumberTracksLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let albumNumberTracksLabelHeightConstraint = albumNumberTracksLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        
        view.addConstraints([albumNumberTracksLabelTopConstraint, albumNumberTracksLabelLeadingConstraint, albumNumberTracksLabelTrailingConstraint, albumNumberTracksLabelHeightConstraint])
        
//        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        let tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
//        let tableViewLeadingConstraint = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let tableViewTrailingConstraint = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        let tableViewBottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//
//
//        view.addConstraints([tableViewTopConstraint, tableViewLeadingConstraint, tableViewTrailingConstraint, tableViewBottomConstraint])
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
}
