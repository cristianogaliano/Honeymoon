//
//  RowAppInfoView.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//

import SwiftUI

struct RowAppInfoView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
                Text(description)
            }
            Divider()
        }
    }
}

struct RowAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RowAppInfoView(title: "title", description: "description")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
