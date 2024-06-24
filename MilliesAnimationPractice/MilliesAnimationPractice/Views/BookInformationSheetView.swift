//
//  BookInformationSheetView.swift
//  MilliesAnimationPractice
//
//  Created by Sooik Kim on 6/24/24.
//

import SwiftUI

struct BookInformationSheetView: View {
    
    let book: Book
    @Binding var selectedCellRect: CGRect

    @Environment(\.dismiss) var dismiss
    
    @Namespace private var namespace
    @State private var onAppeared: Bool = false
    @State private var isContentsShow: Bool = false
    @State private var height: CGFloat = .zero
    
    var body: some View {
        ZStack {
            
            // MARK: Background Dimming View
            if isContentsShow {
                Color.black.opacity(0.4)
                    .frame(maxHeight:.infinity)
                    .transition(.opacity)
                    .transaction {
                        $0.disablesAnimations = isContentsShow
                    }
            }
            
            /// Sheet 가 present 되면 선택한 위치에 똑같은 BookShlefCellView 와 같은 View 를 띄어줌
            /// View 가 onAppear 되면 onAppeared 값을 애니메이션을 줘서 변경
            if !onAppeared {
                VStack(alignment: .leading ,spacing: 12) {
                    Image(book.bookCover)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "image", in: namespace)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(book.title)
                            .font(.headline.weight(.bold))
                            .foregroundStyle(.black)
                            .matchedGeometryEffect(id: "title", in: namespace)
                        
                        Text(book.author)
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.gray)
                            .matchedGeometryEffect(id: "author", in: namespace)
                    }
                    
                }
                .frame(width: selectedCellRect.width, height: selectedCellRect.height)
                .position(x: selectedCellRect.midX, y: selectedCellRect.midY)
                .onAppear {
                    withAnimation(.spring(response: 0.5)) {
                        onAppeared = true
                    }
                    // 애니메이션 중간에 다른 컨텐츠들을 표시해줌
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                        withAnimation(.spring(response: 0.3)) {
                            isContentsShow = true
                        }
                    })
                }
            }
            
            VStack(spacing: 0) {
                Spacer()
                VStack(spacing: 12) {
                    // 북커버, title, 저자 정보 View
                    VStack(spacing: 12) {
                        // 책이 애니메이션으로 넘어오기 전 해당 위치를 확보
                        if onAppeared {
                            Image(book.bookCover)
                                .resizable()
                                .scaledToFit()
                                .matchedGeometryEffect(id: "image", in: namespace)
                            
                            VStack(spacing: 4) {
                                Text(book.title)
                                    .font(.headline.weight(.bold))
                                    .foregroundStyle(.black)
                                    .matchedGeometryEffect(id: "title", in: namespace)
                                
                                Text(book.author)
                                    .font(.subheadline.weight(.semibold))
                                    .foregroundStyle(.gray)
                                    .matchedGeometryEffect(id: "author", in: namespace)
                            }
                        } else {
                            Color.clear
                        }
                        
                    }
                    .frame(width: selectedCellRect.width, height: selectedCellRect.height)
                    .frame(maxWidth: .infinity)
                    
                    VStack(spacing: 12) {
                        if isContentsShow {
                            // 버튼View
                            HStack() {
                                makeButton()
                                Spacer()
                                makeButton()
                                Spacer()
                                makeButton()
                            }
                            
                            ScrollView(content: {
                                ForEach(0..<6, id: \.self) { index in
                                    Rectangle()
                                        .fill(.gray)
                                        .frame(height:0.5)
                                    
                                    Button(action: {
                                        print(index)
                                    }, label: {
                                        Text("버튼 \(index)")
                                            .font(.headline)
                                            .foregroundStyle(.black)
                                            .padding(16)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    })

                                    if index == 5 {
                                        Rectangle()
                                            .fill(.gray)
                                            .frame(height:0.5)
                                    }
                                }
                            })

                            Button(action: {
                                // Dimming View 에 dismiss 애니메이션을 막기 위해
                                isContentsShow = false
                                dismiss()
                            }, label: {
                                Text("닫기")
                                    .foregroundStyle(.black)
                                    .padding(16)
                                    .frame(maxWidth: .infinity)
                            })
                            .padding(.bottom, 24)
                        }
                    }
                    .frame(maxWidth:.infinity)
                    .transition(.opacity)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .background {
                    if isContentsShow {
                        Color.white
                            .roundedCorner(16, corners: [.topLeft, .topRight])
                        // 책의 위치가 Sheet Background 보다 위쪽에 있기에 background 를 내려줌
                            .offset(y: 100)
                            .transition(.opacity)
                    }
                }
                .ignoresSafeArea(edges: [.bottom])
                .frame(height: height / 1.3)
            }
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .background {
            // Sheet 의 높이를 정하기 위해 View 높이값을 가져오기 위한 로직
            GeometryReader { reader in
                Color.clear.onAppear {
                    self.height = reader.size.height
                }
            }
        }
        // Sheet 의 기본 Background 를 투명하게 하기 위함
        .background(ClearBackgroundView())
        
    }
    
    @ViewBuilder private func makeButton() -> some View {
        Group {
            Button(action: {
                print("click button")
            }, label: {
                VStack(spacing: 4) {
                    Image(systemName: "info.circle")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    
                    Text("책정보")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                }
            })
        }
        .frame(maxWidth: .infinity)
    }
}
