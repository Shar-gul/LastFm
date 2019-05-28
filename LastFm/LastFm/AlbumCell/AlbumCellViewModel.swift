//
//  AlbumCellViewModel.swift
//  LastFm
//
//  Created by Tiago Valente on 29/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class AlbumCellViewModel: NSObject {
    
    func fetchData() {
        
    }
    
    func loadViews() {
        
    }

    
    var cell:AlbumViewCell?
    var album: Album?
    var onOrderSelectionEvent: ((Album)->Void)?
    
    func populateCell(_ cell: AlbumViewCell
        , withAlbum album: Album) {
        self.cell = cell
        self.album = album
//        cell.orderNoLabel.text = String.init(format: JFStrings.ORDER_NO, order.orderNo)
//        cell.dateLabel.text = order.date
//        cell.priceLabel.text = String.init(format: JFStrings.TOTAL_NO, JPricesAux.stringForPrice(order.price))
//        cell.backgroundButton.onSelectEvent = { [weak self] _ in
//            if let order = self?.order {
//                self?.onOrderSelectionEvent?(order)
//            }
//        }
    }
}

