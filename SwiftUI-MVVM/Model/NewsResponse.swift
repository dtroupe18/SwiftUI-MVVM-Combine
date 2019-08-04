//
//  NewsResponse.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/4/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
}
