//
//  ClearBackgroundView.swift
//  MilliesAnimationPractice
//
//  Created by Sooik Kim on 6/24/24.
//

import SwiftUI

// FullScreenCover 의 Background 를 투명하게 바꾸기 위한 View
struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

