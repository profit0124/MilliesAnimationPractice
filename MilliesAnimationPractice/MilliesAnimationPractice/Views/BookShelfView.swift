//
//  BookShelfView.swift
//  MilliesAnimationPractice
//
//  Created by Sooik Kim on 6/24/24.
//

import SwiftUI

struct BookShelfView: View {
    
    let books: [Book] = [
        Book(id: UUID().uuidString, title: "title1", author: "author1", bookCover: "bookcover"),
        Book(id: UUID().uuidString, title: "title2", author: "author2", bookCover: "bookcover"),
        Book(id: UUID().uuidString, title: "title3", author: "author3", bookCover: "bookcover"),
        Book(id: UUID().uuidString, title: "title4", author: "author4", bookCover: "bookcover"),
        Book(id: UUID().uuidString, title: "title5", author: "author5", bookCover: "bookcover")
    ]
    
    @State private var preferenceValues: [String: CGRect] = [:]
    @State private var selectedBook: Book?
    @State private var selectedCellRect: CGRect = .zero
    
    var body: some View {
        ZStack {
            ScrollView(content: {
                LazyVStack(spacing: 24) {
                    HStack {
                        Text("5개")
                            .font(.subheadline.weight(.bold))
                        Spacer()
                        HStack(spacing: 8) {
                            Image(systemName: "magnifyingglass")
                                .font(.caption.weight(.bold))
                            Image(systemName: "magnifyingglass")
                                .font(.caption.weight(.bold))
                            Image(systemName: "magnifyingglass")
                                .font(.caption.weight(.bold))
                        }
                    }
                    let column:[GridItem] = Array(repeating: .init(spacing: 16), count: 3)
                    
                    LazyVGrid(columns: column) {
                        ForEach(books, id: \.id) { book in
                            Button(action: {
                                if selectedBook == book {
                                    selectedBook = nil
                                } else {
                                    selectedCellRect = preferenceValues[book.id] ?? .zero
                                    selectedBook = book
                                }
                            }, label: {
                                BookShelfCellView(book: book)
                            })
                        }
                    }
                }
            })
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .navigationTitle("Book Shelf")
            .fullScreenCover(item: $selectedBook, content: {
                BookInformationSheetView(book: $0, selectedCellRect: $selectedCellRect)
            })
            .transaction { transaction in
                // FullScreenCover 가 present 될 때 기본 애니메이션을 막는다.
                transaction.disablesAnimations = selectedBook != nil
            }
        }
        .onPreferenceChange(CustomPreferenceKey<String, CGRect>.self, perform: { value in
            /// 하위 View에서 PrefereceValue 를 변경하면 그 값을 FullScreenSheet 에 넘길 수 있도록 State 값에 할당해준다.
            /// 처음 View 가 생성될 때
            /// Scroll 로 이한여 위치값이 바뀔 때
            /// 업데이트 됨
            self.preferenceValues = value
        })
    }
}

#Preview {
    BookShelfView()
}

