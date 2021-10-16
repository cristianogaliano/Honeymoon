//
//  InitFirestoreDatabase.swift
//  Honeymoon
//
//  Created by  Cristiano on 16/10/21.
//

import Foundation


class InitFirestoreDatabase {
    
    
    // MARK: - DATABASE INITIALIZER
    // USED ONLY THE FIRST TIME TO INITIALIZE THE DATABSE FOR DESTINATION DATA AND PROMOTIONS FOR THIS DEMO APP
    // IN FUTURE THE ADMIN USE WILL BE ABLE TO UPDATE AND UPLOAD DATA TO FIRESTORE REGARDS PROMOTIONS AND PRICES THROUGH A SPECIFIC AREA IN THE APP USING THIS SAME METHOD, ADJUSTED TO THE ADMIN UI
    func initDataFirestore() {
        for destination in demoDestinations {
            let id = UUID().uuidString
            let place = destination.place
            let country = destination.country
            let image = destination.image
            let promotionFrom = destination.promotionFrom
            let promotions = destination.promotions
            var promotionNumber = 1
            
            let destinationsData = db.collection("DestinationsDATA").document(place)
            destinationsData.setData([
                "id" : id,
                "place" : place,
                "country" : country,
                "image" : image,
                "promotionFrom" : promotionFrom
            ])
            for promotion in promotions {
                let promotionsData = db.collection("DestinationsDATA").document(place).collection("Promotions").document("Promotion\(promotionNumber)")
                
                promotionsData.setData([
                    "title" : promotion.title,
                    "description" : promotion.description,
                    "price" : promotion.price,
                    "image" : promotion.image
                ])
                promotionNumber += 1
            }

            
        }
    }
}
