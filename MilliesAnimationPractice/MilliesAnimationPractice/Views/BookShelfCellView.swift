//
//  BookShelfCellView.swift
//  MilliesAnimationPractice
//
//  Created by Sooik Kim on 6/24/24.
//

import SwiftUI

struct BookShelfCellView: View {
    
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(book.bookCover)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(book.title)
                    .font(.headline.weight(.bold))
                    .foregroundStyle(.black)
                Text(book.author)
                    .font(.subheadline.weight(.bold))
                    .foregroundStyle(.gray)
            })
        }
        .background {
            // 해당 View의 CGRect 를 PreferenceValue 로 지정
            GeometryReader { reader in
                Color.clear.preference(key: CustomPreferenceKey<String, CGRect>.self, value: [book.id : reader.frame(in: .global)])
            }
        }
    }
}
