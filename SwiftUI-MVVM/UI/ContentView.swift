//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/4/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {

    @ObservedObject var model = ArticleListViewModel()

    var body: some View {
        NavigationView {
            List(model.articles) { article in

                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title)
                        .lineLimit(nil)
                        .font(.headline)

                    Text(article.description)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                        .font(.body)
                }
            }
            .navigationBarTitle(Text("US News"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
