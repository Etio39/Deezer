//
//  TrackListItem.swift
//  Deezer
//
//  Created by Etienne Chambon on 17/01/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct TrackListItem: View {
    
    @State var track: Track
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: track.album.coverSmall))
                .placeholder {
                    ProgressView()
                }
                .frame(width: 50, height: 50, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(track.title.capitalized)
                    .font(.headline)
                    .minimumScaleFactor(0.01)
                Text(track.artist.name.capitalized)
                    .font(.subheadline)
            }
            Spacer()
            Text("\(track.duration.toDurationDisplay)")
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
    }
}

struct TrackListItem_Previews: PreviewProvider {
    static var previews: some View {
        TrackListItem(track: Track.dumies[0])
    }
}
