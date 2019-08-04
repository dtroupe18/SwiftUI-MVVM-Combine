//
//  NewsResponse.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/4/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()

    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let articleUrlString: String
    let imageUrlString: String?
    let publishedAt: String
    let content: String?

    var publishedDate: Date {
        return dateFormatter.date(from: publishedAt)!
    }

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case articleUrlString = "url"
        case imageUrlString = "urlToImage"
        case publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
