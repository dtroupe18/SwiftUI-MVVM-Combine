//
//  ArticleRow.swift
//  SwiftUI-MVVM
//
//  Created by Dave Troupe on 8/11/19.
//  Copyright © 2019 HighTreeDevelopment. All rights reserved.
//

import SwiftUI

struct ArticleRow: View {
    var articleVM: ArticleViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Title
            Text(articleVM.title)
                .lineLimit(nil)
                .font(.headline)

            // Optional images
            articleVM.imageURL.map { ImageView(url: $0)}

            // Description -- qwe this is also optional?
            Text(articleVM.description)
                .foregroundColor(.primary)
                .lineLimit(nil)
                .font(.body)
                .multilineTextAlignment(.leading)

            // Time label
            Text(articleVM.timeSincePublishedString)
                .foregroundColor(.secondary)
                .lineLimit(1)
                .font(.footnote)
        }
    }
}

//#if DEBUG
//struct ArticleRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleRow()
//    }
//}
//#endif
