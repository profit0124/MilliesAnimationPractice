//
//  RoundedCorner.swift
//  MilliesAnimationPractice
//
//  Created by Sooik Kim on 6/24/24.
//

import SwiftUI

struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner
    
    init(radiuis: CGFloat, corners: UIRectCorner = .allCorners) {
        self.radius = radiuis
        self.corners = corners
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
