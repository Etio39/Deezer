//
//  DeezerAPIClient.swift
//  Deezer
//
//  Created by Etienne Chambon on 16/01/2022.
//

import Foundation
import RxSwift
import Alamofire

struct PlaylistsResponse: Decodable {
    let playlists: [Playlist]
    
    enum CodingKeys: String, CodingKey {
        case playlists = "data"
    }
}

struct TracksResponse: Decodable {
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case tracks = "data"
    }
}

class DeezerAPIClient {
    
    var baseUrl: String
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getPlaylist(for userId: String) -> Single<[Playlist]> {
        return Single.create{ observer in
            let request = AF.request("\(self.baseUrl)/user/\(userId)/playlists")
            
            request.validate().responseDecodable(of: PlaylistsResponse.self) { response in
                switch response.result{
                case .success:
                    guard let playlists = response.value?.playlists else {
                        return
                    }
                    observer(.success(playlists))
                case .failure(let error):
                    observer(.failure(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func getTracks(for playlistId: Int) -> Single<[Track]> {
        return Single.create{ observer in
            let request = AF.request("\(self.baseUrl)/playlist/\(playlistId)/tracks")
            
            request.validate().responseDecodable(of: TracksResponse.self) { response in
                switch response.result{
                case .success:
                    guard let tracks = response.value?.tracks else {
                        return
                    }
                    observer(.success(tracks))
                case .failure(let error):
                    observer(.failure(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
