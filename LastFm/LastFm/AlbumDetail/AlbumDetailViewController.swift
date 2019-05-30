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
    var artistListenersLabel: UILabel = UILabel.init()
    
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
        
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = .white
        
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumImage)
        let albumImageTopConstraint = albumImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        let albumImageCenterXConstraint = albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let albumImageWidthConstraint = albumImage.widthAnchor.constraint(equalToConstant: 250)
        let albumImageHeightConstraint = albumImage.heightAnchor.constraint(equalToConstant: 250)
        viewModel.albumImage = albumImage
        
        view.addConstraints([albumImageTopConstraint, albumImageCenterXConstraint, albumImageWidthConstraint, albumImageHeightConstraint])
        
        albumNameLabel.text = String(format: Strings.albumNameString, "")
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumNameLabel)
        let albumNameLabelTopConstraint = albumNameLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 30)
        let albumNameLabelLeadingConstraint = albumNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let albumNameLabelTrailingConstraint = albumNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let albumNameLabelHeightConstraint = albumNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        viewModel.albumNameLabel = albumNameLabel
        
        view.addConstraints([albumNameLabelTopConstraint, albumNameLabelLeadingConstraint, albumNameLabelTrailingConstraint, albumNameLabelHeightConstraint])
        
        albumNumberTracksLabel.text = String(format: Strings.albumTracksString, "")
        albumNumberTracksLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumNumberTracksLabel)
        let albumNumberTracksLabelTopConstraint = albumNumberTracksLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 30)
        let albumNumberTracksLabelLeadingConstraint = albumNumberTracksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let albumNumberTracksLabelTrailingConstraint = albumNumberTracksLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let albumNumberTracksLabelHeightConstraint = albumNumberTracksLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        viewModel.albumNumberTracksLabel = albumNumberTracksLabel
        view.addConstraints([albumNumberTracksLabelTopConstraint, albumNumberTracksLabelLeadingConstraint, albumNumberTracksLabelTrailingConstraint, albumNumberTracksLabelHeightConstraint])
        
        albumPublishDateLabel.text = String(format: Strings.albumPublishDateString, "")
        albumPublishDateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumPublishDateLabel)
        let albumPublishDateLabelTopConstraint = albumPublishDateLabel.topAnchor.constraint(equalTo: albumNumberTracksLabel.bottomAnchor, constant: 30)
        let albumPublishDateLabelLeadingConstraint = albumPublishDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let albumPublishDateLabelTrailingConstraint = albumPublishDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let albumPublishDateLabelHeightConstraint = albumPublishDateLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        viewModel.albumPublishDateLabel = albumPublishDateLabel
        view.addConstraints([albumPublishDateLabelTopConstraint, albumPublishDateLabelLeadingConstraint, albumPublishDateLabelTrailingConstraint, albumPublishDateLabelHeightConstraint])
        
        artistNameLabel.text = String(format: Strings.artistNameString, "")
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(artistNameLabel)
        let artistNameLabelTopConstraint = artistNameLabel.topAnchor.constraint(equalTo: albumPublishDateLabel.bottomAnchor, constant: 30)
        let artistNameLabelLeadingConstraint = artistNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let artistNameLabelTrailingConstraint = artistNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let artistNameLabelHeightConstraint = artistNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        viewModel.artistNameLabel = artistNameLabel
        view.addConstraints([artistNameLabelTopConstraint, artistNameLabelLeadingConstraint, artistNameLabelTrailingConstraint, artistNameLabelHeightConstraint])
        
        artistListenersLabel.text = String(format: Strings.artistListenersString, "")
        artistListenersLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(artistListenersLabel)
        let artistListenersLabelTopConstraint = artistListenersLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 30)
        let artistListenersLabelLeadingConstraint = artistListenersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let artistListenersLabelTrailingConstraint = artistListenersLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let artistListenersLabelHeightConstraint = artistListenersLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        viewModel.artistListenersLabel = artistListenersLabel
        view.addConstraints([artistListenersLabelTopConstraint, artistListenersLabelLeadingConstraint, artistListenersLabelTrailingConstraint, artistListenersLabelHeightConstraint])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
}
