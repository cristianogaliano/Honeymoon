//
//  AppInfoView.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        VStack {
            RowAppInfoView(title: "Application", description: "Honeymoon")
            RowAppInfoView(title: "Compatibility", description: "iPhone and iPad")
            RowAppInfoView(title: "Developer", description: "Cristiano Galiano")
            RowAppInfoView(title: "Designer", description: "Robert Petras")
            LinkRowAppInfoView(title: "Website", link: URL(string: "https://cristianogaliano.github.io/Portfolio/")!, linkLabel: "MyPortfolio")
            LinkRowAppInfoView(title: "Projects", link: URL(string: "https://github.com/cristianogaliano")!, linkLabel: "My GitHub")
            RowAppInfoView(title: "Version", description: "1.0.0")
            
            
            
            
        }
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
