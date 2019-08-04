//
//  ArticleViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/4/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import Foundation

final class ArticleViewModel: Identifiable {

    let id = UUID()
    let article: Article

    init(article: Article) {
        self.article = article
    }

    var title: String {
        return self.article.title
    }

    var description: String {
        return self.article.description ?? ""
    }
}
