//
//  ImageLoader.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/11/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import Foundation
import Combine

final class Loader: ObservableObject {

    let objectWillChange = PassthroughSubject<Data?, Never>()

    var task: URLSessionDataTask?

    var url: URL? {
        didSet {
            createTask()
        }
    }

    var data: Data? = nil {
        didSet {
            objectWillChange.send(data)
        }
    }

    func createTask() {
        guard let url = self.url else { return }

        task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
        })
        task?.resume()
    }

    deinit {
        task?.cancel()
    }
}
