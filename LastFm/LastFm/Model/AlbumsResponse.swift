//
//  AlbumsResponse.swift
//  LastFm
//
//  Created by Tiago Valente on 29/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

struct AlbumsResponse: Codable {
    let albums: Albums
}

// MARK: - Albums
struct Albums: Codable {
    let album: [Album]
}

// MARK: - Album
struct Album: Codable {
    let name, mbid: String
    let url: String
    let artist: Artist
    let image: [Image]
    let attr: Attr
    
    enum CodingKeys: String, CodingKey {
        case name, mbid, url, artist, image
        case attr = "@attr"
    }
}

// MARK: - Artist
struct Artist: Codable {
    let name, mbid: String
    let url: String
}

// MARK: - Attr
struct Attr: Codable {
    let rank: String
}

// MARK: - Image
struct Image: Codable {
    let text: String
    let size: String
    
    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}
