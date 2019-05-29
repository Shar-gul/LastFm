//
//  AlbumListViewController.swift
//  LastFm
//
//  Created by Tiago Valente on 28/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController {
    
    var viewModel: AlbumListViewModel
    
    init() {
        self.viewModel = AlbumListViewModel.init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
}
