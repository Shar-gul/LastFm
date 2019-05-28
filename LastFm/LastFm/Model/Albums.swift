//
//  Albums.swift
//  LastFm
//
//  Created by Tiago Valente on 28/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

class Albums: Decodable {
    var albums: [Album]
}

class Album: Decodable {
    var name: String?
    var mbid: String?
    var url: String?
    var artist: Artist
    var image: [Image]
    var attr: String?
    var listeners: String?
    var playcount: String?
    var tracks: [Tracks]?
}

class Artist: Decodable {
    var name: String
    var mbid: String
    var url: String
}

class Image: Decodable {
    var text: String
    var size: String
}

class Tracks: Decodable {
    var name: String
    var url: String
    var duration: String
    var attr: String?
    var streamable: Streamable?
    var artist: Artist
}

class Streamable: Decodable {
    var text: String?
    var fullTrack: String?
}
