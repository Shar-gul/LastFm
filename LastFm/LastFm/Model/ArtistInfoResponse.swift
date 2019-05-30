//
//  ArtistInfoResponse.swift
//  LastFm
//
//  Created by Tiago Valente on 30/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

struct ArtistInfoResponse: Codable {
    let artist: ArtistInfoResponseArtist
}

struct ArtistInfoResponseArtist: Codable {
    let name: String
    let mbid: String?
    let url: String
    let image: [Image]
    let streamable, ontour: String
    let stats: Stats
    let similar: Similar
    let tags: Tags
    let bio: Bio
}

struct Bio: Codable {
    let links: Links
    let published, summary, content: String
}

struct Links: Codable {
    let link: Link
}

struct Link: Codable {
    let text, rel: String
    let href: String
    
    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case rel, href
    }
}

struct Similar: Codable {
    let artist: [ArtistElement]
}

struct ArtistElement: Codable {
    let name: String
    let url: String
    let image: [Image]
}

struct Stats: Codable {
    let listeners: String
    let playcount: String
}
