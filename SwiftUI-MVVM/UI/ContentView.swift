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

                NavigationLink(destination: WebView(request: URLRequest(url: URL(string: articleVM.urlString)!))) {
                    ArticleRow(articleVM: articleVM)
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
