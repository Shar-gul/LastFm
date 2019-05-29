//
//  Albums.swift
//  LastFm
//
//  Created by Tiago Valente on 28/05/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation

//class Albums: Decodable {
//    var albums: [String : [Album]]
//}
//
//class Album: Decodable {
//    var name: String?
//    var mbid: String?
//    var url: String?
//    var artist: Artist
//    var image: [Image]
//    var attr: Attr?
//    //var listeners: String?
//    //var playcount: String?
//    //var tracks: [Tracks]?
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case mbid = "mbid"
//        case url = "url"
//        case artist = "artist"
//        case image = "image"
//        case attr = "@attr"
//    }
//
//    required init(from coder: Decoder) throws {
//        let container = try coder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.mbid = try container.decode(String.self, forKey: .mbid)
//        self.url = try container.decode(String.self, forKey: .url)
//        self.artist = try container.decode(Artist.self, forKey: .artist)
//        self.image = try container.decode(Array<Image>.self, forKey: .image)
//        self.attr = try container.decode(Attr.self, forKey: .attr)
//    }
//}
//
//class Artist: Decodable {
//    var name: String
//    var mbid: String
//    var url: String
//}
//
//class Attr: Decodable {
//    var rank: String
//}
//
//class Image: Decodable {
//
//    var text: String
//    var size: String
//
//    enum CodingKeys: String, CodingKey {
//        case text = "#text"
//        case size = "size"
//    }
//
//    required init(from coder: Decoder) throws {
//        let container = try coder.container(keyedBy: CodingKeys.self)
//        self.text = try container.decode(String.self, forKey: .text)
//        self.size = try container.decode(String.self, forKey: .size)
//    }
//}
//
//class Tracks: Decodable {
//    var name: String
//    var url: String
//    var duration: String
//    var attr: String?
//    var streamable: Streamable?
//    var artist: Artist
//}
//
//class Streamable: Decodable {
//    var text: String?
//    var fullTrack: String?
//}
