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
            List(model.articleViewModels) { article in

                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title)
                        .lineLimit(nil)
                        .font(.headline)

                    Text(article.description)
                        .foregroundColor(.primary)
                        .lineLimit(nil)
                        .font(.body)
                        .multilineTextAlignment(.leading)

                    Text(article.timeSincePublishedString)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .font(.footnote)
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
