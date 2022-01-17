//
//  PlaylistCard.swift
//  Deezer
//
//  Created by Etienne Chambon on 15/01/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaylistCard: View {
    @State var playlist: Playlist
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(spacing: 0) {
            AnimatedImage(url: URL(string: playlist.pictureMedium))
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding(4)
                .matchedGeometryEffect(id: "image\(playlist.id)", in: namespace)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(playlist.title.capitalized)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                        .font(.body)
                        .minimumScaleFactor(0.01)
                        .matchedGeometryEffect(id: "title\(playlist.id)", in: namespace)
                        .padding(8)
                }
                .frame(minHeight: 30)
            }
        }
        .background(
            Rectangle()
                .fill(.white)
                .cornerRadius(16)
                .shadow(radius: 5)
                .matchedGeometryEffect(id: "card\(playlist.id)", in: namespace)
        )
        .padding(8)
    }
}

struct PlaylistCard_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PlaylistCard(playlist: Playlist.dumy, namespace: namespace)
    }
}
