//
//  Book.swift
//  MilliesAnimationPractice
//
//  Created by Sooik Kim on 6/24/24.
//

import Foundation

struct Book: Identifiable, Equatable, Hashable {
    let id: String
    let title: String
    let author: String
    let bookCover: String
}
