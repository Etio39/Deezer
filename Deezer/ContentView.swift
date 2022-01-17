//
//  ContentView.swift
//  Deezer
//
//  Created by Etienne Chambon on 15/01/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @Namespace private var namespace
    @StateObject var viewModel = DeezerViewModel(updatePlaylist: true)
    @State var showDetails = false
    @State var showTracks = false
    @State var selectedPlaylist: Playlist?
    
    let columns = [GridItem](repeating: GridItem(.flexible()), count: Constants.columnCount)
    
    var body: some View {
        if viewModel.playlists.isEmpty {
            ProgressView()
        } else {
            if showDetails {
                HStack {
                    PlaylistDetailsView(namespace: namespace, selectedPlaylist: selectedPlaylist) {
                        withAnimation(Animation.easeInOut) {
                            showDetails = false
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .background(.ultraThinMaterial)
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.playlists, id: \.self) { playlist in
                            VStack {
                                PlaylistCard(playlist: playlist, namespace: namespace)
                                    .onTapGesture {
                                        selectedPlaylist = playlist
                                        withAnimation(Animation.easeInOut) {
                                            showDetails = true
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedPlaylist: Playlist.dumy)
    }
}
