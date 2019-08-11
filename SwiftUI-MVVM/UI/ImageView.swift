//
//  ImageView.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/11/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import SwiftUI
import Combine

let placeholder = UIImage(systemName: "photo")!

struct ImageView: View {
    @ObservedObject private var imageLoader = Loader()

    let urlString: String?
    let url: URL?

    init(urlString: String?) {
        self.urlString = urlString

        if let urlStr = urlString {
            self.url = URL(string: urlStr)
            imageLoader.url = self.url
        } else {
            self.url = nil
        }
    }

    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }

    var body: some View {
        Image(uiImage: image ?? placeholder)
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
}

#if DEBUG
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: "google.com")
    }
}
#endif
