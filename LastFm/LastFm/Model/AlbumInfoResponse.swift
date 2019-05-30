//
//  AlbumInfoResponse.swift
//  LastFm
//
//  Created by Tiago Valente on 29/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

struct AlbumInfoResponse: Codable {
    let album: AlbumInfo
}

struct AlbumInfo: Codable {
    let name: String
    let artist: String
    let url: String
    let image: [Image]
    let listeners: String
    let playcount: String
    let tracks: Tracks
    let tags: Tags?
    let wiki: Wiki?
}

struct Tags: Codable {
    let tag: [Tag]?
}

struct Tag: Codable {
    let name: String?
    let url: String?
}

struct Tracks: Codable {
    let track: [Track]
}

struct Track: Codable {
    let name: String
    let url: String
    let duration: String
    let attr: Attr
    let streamable: Streamable
    let artist: ArtistInfo
    
    enum CodingKeys: String, CodingKey {
        case name, url, duration
        case attr = "@attr"
        case streamable, artist
    }
}

struct ArtistInfo: Codable {
    let name: String
    let mbid: String?
    let url: String
}

struct Streamable: Codable {
    let text, fulltrack: String
    
    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case fulltrack
    }
}

struct Wiki: Codable {
    let published: String?
    let summary: String?
    let content: String?
}
