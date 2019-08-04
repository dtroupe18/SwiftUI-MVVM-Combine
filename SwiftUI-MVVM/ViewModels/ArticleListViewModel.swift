//
//  ArticleListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/4/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import Foundation
import Combine

final class ArticleListViewModel: ObservableObject {

    let objectWillChange = PassthroughSubject<ArticleListViewModel,Never>()

    init() {
        fetchTopHeadlines()
    }

    var articleViewModels = [ArticleViewModel]() {
        didSet {
            objectWillChange.send(self)
        }
    }

    private func fetchTopHeadlines() {
        NetworkService().loadTopHeadlines(onSuccess: { [weak self] articleArray in
            guard let sself = self else { return }
            sself.articleViewModels = articleArray.map(ArticleViewModel.init)
        }, onError: { /*[weak self]*/ error in
            print(error.localizedDescription)
        })
    }
}
