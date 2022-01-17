//
//  DeezerViewModel.swift
//  Deezer
//
//  Created by Etienne Chambon on 16/01/2022.
//

import Foundation
import SwiftUI
import RxSwift

class DeezerViewModel: ObservableObject {
    
    @Published var playlists: [Playlist] = []
    @Published var tracks: [Track] = [] //Track.dumies
    
    let deezerApiClient: DeezerAPIClient = DeezerAPIClient(baseUrl: Constants.baseURL)
    let disposeBag = DisposeBag()
    
    init(updatePlaylist: Bool = false) {
        if updatePlaylist {
            updatePlaylists()
        }
    }
    
    func updatePlaylists() {
        deezerApiClient
            .getPlaylist(for: Constants.userId)
            .subscribe { [weak self] playlists in
                self?.playlists = playlists
            } onFailure: { error in
                print(error.localizedDescription)
            } onDisposed: {
                
            }.disposed(by: disposeBag)
    }
    
    func getTracks(for playlistId: Int) {
        deezerApiClient
            .getTracks(for: playlistId)
            .subscribe { [weak self] tracks in
                self?.tracks = tracks
            } onFailure: { error in
                print(error.localizedDescription)
            } onDisposed: {
                
            }.disposed(by: disposeBag)
    }
}
