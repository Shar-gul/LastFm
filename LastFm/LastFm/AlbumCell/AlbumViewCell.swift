//
//  AlbumViewCell.swift
//  LastFm
//
//  Created by Tiago Valente on 29/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class AlbumViewCell: UITableViewCell {
    
    let albumImage = UIImageView.init()
    let albumLabel = UILabel.init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = UIColor.white
        
        albumImage.image = UIImage(named: "")
        addSubview(albumImage)
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        let albumImageTopConstraint = albumImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        let albumImageLeadingConstraint = albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        let albumImageWidthConstraint = albumImage.widthAnchor.constraint(equalToConstant: 50)
        let albumImageHeightConstraint = albumImage.heightAnchor.constraint(equalToConstant: 50)
        let albumImageBottomConstraint = albumImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10)
        
        contentView.addConstraints([albumImageTopConstraint, albumImageLeadingConstraint, albumImageWidthConstraint, albumImageHeightConstraint, albumImageBottomConstraint])
        
        albumLabel.text = ""
        contentView.addSubview(albumLabel)
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        let albumLabelLeadingConstraint = albumLabel.leadingAnchor.constraint(equalTo: albumImage.leadingAnchor, constant: 10)
        let albumLabelTrailingConstraint = albumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        let albumLabelCenterYConstraint = albumLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        contentView.addConstraints([albumLabelLeadingConstraint, albumLabelTrailingConstraint, albumLabelCenterYConstraint])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
