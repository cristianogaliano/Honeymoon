//
//  LinkRowAppInfoView.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//

import SwiftUI

struct LinkRowAppInfoView: View {
    var title: String
    var link: URL
    var linkLabel: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
                Link(destination: link) {
                    Text(linkLabel)
                }
            }
            Divider()
        }
    }
}

struct LinkRowAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        LinkRowAppInfoView(title: "title", link: URL(string: "https://google.com")!, linkLabel: "LinkLabel")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
