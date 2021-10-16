//
//  Destination.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//

import SwiftUI

struct Destination {
    var id: String
    var place: String
    var country: String
    var image: String
    var like: Bool?
    var promotionFrom: String
    var promotions: [Promotion]
}

struct Promotion {
    var title: String
    var description: String
    var price: String
    var image: String
}


