//
//  ErrorResponse.swift
//  LastFm
//
//  Created by Tiago Valente on 29/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    let error: Int
    let message: String
    let links: [String]?
}
