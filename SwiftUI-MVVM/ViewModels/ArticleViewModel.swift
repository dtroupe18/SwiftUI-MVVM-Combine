//
//  ArticleViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/4/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import Foundation

final class ArticleViewModel: Identifiable {

    private let calendar = Calendar.current
    private let now = Date()

    let id = UUID()
    private let article: Article

    init(article: Article) {
        self.article = article
    }

    var title: String {
        return self.article.title
    }

    var description: String {
        return self.article.articleDescription ?? ""
    }

    var timeSincePublishedString: String {
        let components = calendar.dateComponents([.hour, .minute], from: article.publishedDate, to: now)

        if let hours = components.hour, hours > 0 {
            return "\(hours)h ago"
        } else if let mintutes = components.minute, mintutes > 0 {
            return "\(mintutes)m ago"
        } else {
            return "now"
        }
    }

    var imageUrlString: String? {
        return article.imageUrlString
    }

//    var imageUrl: URL? {
//        guard let urlString = article.imageUrlString else { return nil }
//        return URL(string: urlString)
//    }
}
