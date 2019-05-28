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
        backgroundColor = UIColor.clear
        
//        backgroundButton.backgroundColor = JMaterialStyle.Colors.white
//        backgroundButton.layer.cornerRadius = 0
//        contentView.addSubview(backgroundButton)
//        backgroundButton.translatesAutoresizingMaskIntoConstraints = false
//        backgroundButton.jaTopAnchor.constraint(equalTo: contentView.jaTopAnchor)
//        backgroundButton.jaLeadingAnchor.constraint(equalTo: contentView.jaLeadingAnchor)
//        backgroundButton.jaTrailingAnchor.constraint(equalTo: contentView.jaTrailingAnchor)
//        backgroundButton.jaHeightAnchor.constraint(greaterThanOrEqualToConstant: 0)
//        
//        orderNoLabel.textColor = JMaterialStyle.Colors.gray800
//        orderNoLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        orderNoLabel.text = "orderNoLabel"
//        backgroundButton.addSubview(orderNoLabel)
//        orderNoLabel.translatesAutoresizingMaskIntoConstraints = false
//        orderNoLabel.jaTopAnchor.constraint(equalTo: backgroundButton.jaTopAnchor, constant: 10)
//        orderNoLabel.jaLeadingAnchor.constraint(equalTo: backgroundButton.jaLeadingAnchor, constant: 20)
//        orderNoLabel.jaTrailingAnchor.constraint(equalTo: backgroundButton.jaTrailingAnchor, constant: -20)
//        orderNoLabel.jaHeightAnchor.constraint(greaterThanOrEqualToConstant: 0)
//        
//        dateLabel.textColor = JMaterialStyle.Colors.gray500
//        dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
//        dateLabel.text = "dateLabel"
//        backgroundButton.addSubview(dateLabel)
//        dateLabel.translatesAutoresizingMaskIntoConstraints = false
//        dateLabel.jaTopAnchor.constraint(equalTo: orderNoLabel.jaBottomAnchor, constant: 5)
//        dateLabel.jaLeadingAnchor.constraint(equalTo: backgroundButton.jaLeadingAnchor, constant: 20)
//        dateLabel.jaTrailingAnchor.constraint(equalTo: backgroundButton.jaTrailingAnchor, constant: -20)
//        dateLabel.jaHeightAnchor.constraint(greaterThanOrEqualToConstant: 0)
//        
//        priceLabel.textColor = JMaterialStyle.Colors.gray500
//        priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
//        priceLabel.text = "priceLabel"
//        backgroundButton.addSubview(priceLabel)
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
//        priceLabel.jaTopAnchor.constraint(equalTo: dateLabel.jaBottomAnchor, constant: 5)
//        priceLabel.jaLeadingAnchor.constraint(equalTo: backgroundButton.jaLeadingAnchor, constant: 20)
//        priceLabel.jaTrailingAnchor.constraint(equalTo: backgroundButton.jaTrailingAnchor, constant: -20)
//        priceLabel.jaHeightAnchor.constraint(greaterThanOrEqualToConstant: 0)
//        
//        backgroundButton.jaBottomAnchor.constraint(equalTo: priceLabel.jaBottomAnchor, constant: 10)
//        
//        contentView.jaBottomAnchor.constraint(equalTo: backgroundButton.jaBottomAnchor, constant: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
