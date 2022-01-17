//
//  Track.swift
//  Deezer
//
//  Created by Etienne Chambon on 17/01/2022.
//

import Foundation

// MARK: - Track
class Track: Identifiable, Codable, Hashable {
    
    let id: Int
    let readable: Bool
    let title, titleShort, titleVersion: String
    let link: String
    let duration, rank: Int
    let explicitLyrics: Bool
    let explicitContentLyrics, explicitContentCover: Int
    let preview: String
    let md5Image: String
    let timeAdd: Int
    let artist: Artist
    let album: Album
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case md5Image = "md5_image"
        case timeAdd = "time_add"
        case artist, album, type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Track, rhs: Track) -> Bool {
        lhs.id == rhs.id
    }
    
    internal init(id: Int, readable: Bool, title: String, titleShort: String, titleVersion: String, link: String, duration: Int, rank: Int, explicitLyrics: Bool, explicitContentLyrics: Int, explicitContentCover: Int, preview: String, md5Image: String, timeAdd: Int, artist: Artist, album: Album, type: String) {
        self.id = id
        self.readable = readable
        self.title = title
        self.titleShort = titleShort
        self.titleVersion = titleVersion
        self.link = link
        self.duration = duration
        self.rank = rank
        self.explicitLyrics = explicitLyrics
        self.explicitContentLyrics = explicitContentLyrics
        self.explicitContentCover = explicitContentCover
        self.preview = preview
        self.md5Image = md5Image
        self.timeAdd = timeAdd
        self.artist = artist
        self.album = album
        self.type = type
    }
}

// MARK: - Album
class Album: Identifiable, Codable, Hashable {
    
    let id: Int
    let title: String
    let cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image: String
    let tracklist: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case tracklist, type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Album, rhs: Album) -> Bool {
        lhs.id == rhs.id
    }
    
    internal init(id: Int, title: String, cover: String, coverSmall: String, coverMedium: String, coverBig: String, coverXl: String, md5Image: String, tracklist: String, type: String) {
        self.id = id
        self.title = title
        self.cover = cover
        self.coverSmall = coverSmall
        self.coverMedium = coverMedium
        self.coverBig = coverBig
        self.coverXl = coverXl
        self.md5Image = md5Image
        self.tracklist = tracklist
        self.type = type
    }
}

// MARK: - Artist
class Artist: Identifiable, Codable, Hashable {
    
    let id: Int
    let name: String
    let link, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let tracklist: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Artist, rhs: Artist) -> Bool {
        lhs.id == rhs.id
    }
    
    internal init(id: Int, name: String, link: String, picture: String, pictureSmall: String, pictureMedium: String, pictureBig: String, pictureXl: String, tracklist: String, type: String) {
        self.id = id
        self.name = name
        self.link = link
        self.picture = picture
        self.pictureSmall = pictureSmall
        self.pictureMedium = pictureMedium
        self.pictureBig = pictureBig
        self.pictureXl = pictureXl
        self.tracklist = tracklist
        self.type = type
    }
}

extension Track {
    static var dumies: [Track] {
        return [Track](
            repeating: Track(id: 3368919,
                             readable: true,
                             title: "Cherry Blossom Girl (Radio Mix)",
                             titleShort: "Cherry Blossom Girl",
                             titleVersion: "(Radio Mix)",
                             link: "https://www.deezer.com/track/3368919",
                             duration: 222,
                             rank: 17,
                             explicitLyrics: false,
                             explicitContentLyrics: 0,
                             explicitContentCover: 2,
                             preview: "https://cdns-preview-1.dzcdn.net/stream/c-1a8b393bb637630bfc6c8ee4d64e9e03-4.mp3",
                             md5Image: "40a220ad3916c5038a6c40816590147e",
                             timeAdd: 0,
                             artist: Artist(id: 369,
                                            name: "Air",
                                            link: "https://www.deezer.com/artist/369",
                                            picture: "https://api.deezer.com/artist/369/image",
                                            pictureSmall: "https://e-cdns-images.dzcdn.net/images/artist/17a623adeeed4bbe95a6b402ca704b76/56x56-000000-80-0-0.jpg",
                                            pictureMedium: "https://e-cdns-images.dzcdn.net/images/artist/17a623adeeed4bbe95a6b402ca704b76/250x250-000000-80-0-0.jpg",
                                            pictureBig: "https://e-cdns-images.dzcdn.net/images/artist/17a623adeeed4bbe95a6b402ca704b76/500x500-000000-80-0-0.jpg",
                                            pictureXl: "https://e-cdns-images.dzcdn.net/images/artist/17a623adeeed4bbe95a6b402ca704b76/1000x1000-000000-80-0-0.jpg",
                                            tracklist: "https://api.deezer.com/artist/369/top?limit=50",
                                            type: "artist"),
                             album:  Album(id: 320417,
                                           title: "Cherry Blossom Girl",
                                           cover: "https://api.deezer.com/album/320417/image",
                                           coverSmall: "https://e-cdns-images.dzcdn.net/images/cover/40a220ad3916c5038a6c40816590147e/56x56-000000-80-0-0.jpg",
                                           coverMedium: "https://e-cdns-images.dzcdn.net/images/cover/40a220ad3916c5038a6c40816590147e/250x250-000000-80-0-0.jpg",
                                           coverBig: "https://e-cdns-images.dzcdn.net/images/cover/40a220ad3916c5038a6c40816590147e/500x500-000000-80-0-0.jpg",
                                           coverXl: "https://e-cdns-images.dzcdn.net/images/cover/40a220ad3916c5038a6c40816590147e/1000x1000-000000-80-0-0.jpg",
                                           md5Image: "40a220ad3916c5038a6c40816590147e",
                                           tracklist: "https://api.deezer.com/album/320417/tracks",
                                           type: "album"),
                             type: "track"),
            count: 10)
        
    }
}
