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

    @ObservedObject private var model = ArticleListViewModel()

    var body: some View {
        NavigationView {
            List(model.articleViewModels) { articleVM in

                VStack(alignment: .leading, spacing: 8) {
                    Text(articleVM.title)
                        .lineLimit(nil)
                        .font(.headline)

                    ImageView(urlString: articleVM.imageUrlString)

                    Text(articleVM.description)
                        .foregroundColor(.primary)
                        .lineLimit(nil)
                        .font(.body)
                        .multilineTextAlignment(.leading)

                    Text(articleVM.timeSincePublishedString)
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
