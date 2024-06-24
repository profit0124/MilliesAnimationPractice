//
//  View+.swift
//  MilliesAnimationPractice
//
//  Created by Sooik Kim on 6/24/24.
//

import SwiftUI

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radiuis: radius, corners: corners))
    }
}
