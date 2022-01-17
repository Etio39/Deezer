//
//  Extensions.swift
//  Deezer
//
//  Created by Etienne Chambon on 17/01/2022.
//

import Foundation
import SwiftUI

extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension Int {
    var toDurationDisplay: String {
        String(format: "%02d:%02d:%02d", self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
}

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
