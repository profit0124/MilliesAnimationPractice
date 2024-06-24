//
//  ContentView.swift
//  MilliesAnimationPractice
//
//  Created by Sooik Kim on 6/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("책장 바로가기", destination: {
                    BookShelfView()
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
