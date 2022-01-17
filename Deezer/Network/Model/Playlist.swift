//
//  Playlist.swift
//  Deezer
//
//  Created by Etienne Chambon on 16/01/2022.
//

import Foundation

// MARK: - Playlist
struct Playlist: Identifiable, Codable, Hashable {
    
    let id: Int
    let title: String
    let duration: Int
    let welcomePublic, isLovedTrack, collaborative: Bool
    let nbTracks, fans: Int
    let link, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let checksum: String
    let tracklist: String
    let creationDate, md5Image, pictureType: String
    let timeAdd, timeMod: Int
    let creator: Creator
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, duration
        case welcomePublic = "public"
        case isLovedTrack = "is_loved_track"
        case collaborative
        case nbTracks = "nb_tracks"
        case fans, link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case checksum, tracklist
        case creationDate = "creation_date"
        case md5Image = "md5_image"
        case pictureType = "picture_type"
        case timeAdd = "time_add"
        case timeMod = "time_mod"
        case creator, type
    }
}

extension Playlist {
    static var dumy: Playlist {
        Playlist(id: 757807, title: "a decouvrir", duration: 642, welcomePublic: true, isLovedTrack: false, collaborative: false, nbTracks: 3, fans: 7, link: "https://www.deezer.com/playlist/757807", picture: "https://e-cdns-images.dzcdn.net/images/cover/0a72fa334ad5b0e8bc9ca30aed4d4240/250x250-000000-80-0-0.jpg", pictureSmall: "https://e-cdns-images.dzcdn.net/images/cover/0a72fa334ad5b0e8bc9ca30aed4d4240/250x250-000000-80-0-0.jpg", pictureMedium: "https://e-cdns-images.dzcdn.net/images/cover/0a72fa334ad5b0e8bc9ca30aed4d4240/250x250-000000-80-0-0.jpg", pictureBig: "https://e-cdns-images.dzcdn.net/images/cover/0a72fa334ad5b0e8bc9ca30aed4d4240/250x250-000000-80-0-0.jpg", pictureXl: "https://e-cdns-images.dzcdn.net/images/cover/0a72fa334ad5b0e8bc9ca30aed4d4240/250x250-000000-80-0-0.jpg", checksum: "c4edff79cd9b77ee055fde92512f11e1", tracklist: "https://api.deezer.com/playlist/757807/tracks", creationDate: "2013-11-06 18:00:00", md5Image: "0a72fa334ad5b0e8bc9ca30aed4d4240", pictureType: "cover", timeAdd: 3600, timeMod: 1383760800, creator: Creator(id: 2529, name: "dadbond", tracklist: "https://api.deezer.com/user/2529/flow", type: "user"), type: "playlist")
    }
}

// MARK: - Creator
struct Creator: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let tracklist: String
    let type: String
}
