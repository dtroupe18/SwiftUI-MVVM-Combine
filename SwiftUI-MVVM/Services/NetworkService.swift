//
//  NetworkService.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/4/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import UIKit

typealias ErrorCallback = (Error) -> Void
typealias ArticleCallback = ([Article]) -> Void

private enum RequestError: String, Error {
    case noData = "No response from server please try again."
    case decodeFailed = "The server response is missing data. Please try again."
    case badUrl = "Server url is invalid."

    var error: Error {
        return NSError(domain: "", code: 100, userInfo: [NSLocalizedDescriptionKey : self.rawValue]) as Error
    }
}

final class NetworkService {
    private let path = Bundle.main.path(forResource: "Keys", ofType: "plist")!

    private var apiKey: String {
        return NSDictionary(contentsOfFile: path)!.value(forKey: "ApiKey") as! String
    }

    private let baseURL: String =  "https://newsapi.org/v2/top-headlines?country=us&apiKey="

    func loadTopHeadlines(onSuccess: ArticleCallback?, onError: ErrorCallback?) {
        guard let url = URL(string: "\(baseURL)\(apiKey)") else {
            onError?(RequestError.badUrl.error)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let err = error {
                DispatchQueue.main.async {
                    onError?(err)
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    onError?(RequestError.noData.error)
                }
                return
            }

            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
            print(json.asJSON)

            do {
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    onSuccess?(response.articles)
                }

            } catch let error {
                DispatchQueue.main.async {
                    onError?(error)
                }
            }
        }.resume()
    }
}
