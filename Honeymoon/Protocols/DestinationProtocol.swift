//
//  DestinationProtocol.swift
//  Honeymoon
//
//  Created by  Cristiano on 17/10/21.
//

import Foundation

protocol DestinationProtocol {
    var id: String { get }
    var place: String { get }
    var country: String { get }
    var image: String { get }
    var like: Bool? { get }
    var promotionFrom: String { get }
    var promotions: [PromotionProtocol] { get }
}

protocol PromotionProtocol {
    var title: String { get }
    var description: String { get }
    var price: String { get }
    var image: String { get }
}
