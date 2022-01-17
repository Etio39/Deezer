//
//  PlaylistDetailsView.swift
//  Deezer
//
//  Created by Etienne Chambon on 17/01/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaylistDetailsView: View {
    
    var namespace: Namespace.ID
    @StateObject var viewModel = DeezerViewModel()
    @State var showTracks = false
    @State var selectedPlaylist: Playlist?
    var closeButtonAction: (() -> ())
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                Spacer()
                Button(action: {
                    closeButtonAction()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .tint(.gray)
                })
                    .padding([.top, .trailing])
            }
            
            Text(selectedPlaylist?.title.capitalized ?? "")
                .frame(maxWidth: .infinity)
                .font(.largeTitle)
                .padding(.bottom)
                .matchedGeometryEffect(id: "title\(selectedPlaylist?.id ?? 0)", in: namespace)
            
            AnimatedImage(url: URL(string: selectedPlaylist?.pictureBig ?? ""))
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
                .shadow(radius: 16)
                .padding([.leading, .trailing], 50)
                .matchedGeometryEffect(id: "image\(selectedPlaylist?.id ?? 0)", in: namespace)
            
            HStack {
                Text(String(format: "creator_display".localized, selectedPlaylist?.creator.name.capitalized ?? "N/A"))
                    .matchedGeometryEffect(id: "creator\(selectedPlaylist?.id ?? 0)", in: namespace)
                
                Spacer()
                
                Text(String(format: "duration_display".localized, selectedPlaylist?.duration.toDurationDisplay ?? "N/A"))
                    .matchedGeometryEffect(id: "duration\(selectedPlaylist?.id ?? 0)", in: namespace)
            }
            .padding()
            
            Button(action: {
                withAnimation {
                    showTracks.toggle()
                }
                if showTracks && viewModel.tracks.isEmpty {
                    viewModel.getTracks(for: selectedPlaylist?.id ?? 0)
                }
            }, label: {
                HStack {
                    Text(showTracks == false ? "see_tracks_btn".localized : "close_btn".localized)
                    Image(systemName: showTracks == false ? "chevron.down" : "chevron.up")
                }
                .padding(.bottom, 8)
                .matchedGeometryEffect(id: "button\(selectedPlaylist?.id ?? 0)", in: namespace)
            })
            
            if showTracks {
                if viewModel.tracks.isEmpty {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(viewModel.tracks) {
                        TrackListItem(track: $0)
                    }
                    .padding([.leading, .trailing, .bottom])
                    .onAppear() {
                        UITableView.appearance().backgroundColor = UIColor.clear
                        UITableViewCell.appearance().backgroundColor = UIColor.clear
                    }
                }
            }
            
        }
        .background(
            Rectangle()
                .fill(.white)
                .cornerRadius(16)
                .shadow(radius: 5)
                .matchedGeometryEffect(id: "card\(selectedPlaylist?.id ?? 0)", in: namespace)
        )
        .padding()
    }
}

struct PlaylistDetailsView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PlaylistDetailsView(namespace: namespace, selectedPlaylist: Playlist.dumy) {
            
        }
    }
}

