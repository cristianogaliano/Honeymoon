//
//  FirestoreDatabase+Methods.swift
//  Honeymoon
//
//  Created by  Cristiano on 18/10/21.
//

import SwiftUI
import Firebase
import Combine

 var destinationsGlobal: [DestinationProtocol] = [DestinationProtocol]()

class DataSource: DataReader, SavePreferenceProtocol {
    @ObservedObject var user = UserAuth.shared
    let db = Firestore.firestore()
    
    
    override init() {
        super.init()
        prepare()
    }
    
    override func prepare() {
        getDestinations()
    }
    
    private func getDestinations() {

        var promotionArray = [PromotionProtocol]()
                
        db.collection("DestinationsDATA").getDocuments { querysnapshot, error in
            guard let destinations = querysnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            for destination in destinations {
                destination.reference.collection("Promotions").getDocuments { promotionQueySnapshot, promError in
                    guard let promotions = promotionQueySnapshot?.documents else {
                        print("Error fetching promotions: \(promError!)")
                        return
                    }
                    
                    promotionArray = [PromotionProtocol]()
                    for promotion in promotions {
                        promotionArray.append(Promotion(
                            title: promotion["title"] as! String,
                            description: promotion["description"] as! String,
                            price: promotion["price"] as! String,
                            image: promotion["image"] as! String))}
                    
                    destinationsGlobal.append(Destination(
                        id: destination["id"] as! String,
                        place: destination["place"] as! String,
                        country: destination["country"] as! String,
                        image: destination["image"] as! String,
                        promotionFrom: destination["promotionFrom"] as! String,
                        promotions: promotionArray))
                    
                    
                    
                }// Promotions GETDOCUMENTS
            }//DESTINATION LOOP
        }//DESTINATIONS GETDOCUMENTS

    }
    
    
    // MARK: - SAVE PREFERENCE
    func savePreference(of card: CardView, like: Bool) {
        // MARK: - SAVE/UPDATE FIRESTORE
        
        if let userEmail = user.user?.email {
            let id = UUID().uuidString
            let place = card.destination.place
            let userData = db.collection("Users").document(userEmail).collection("PlacePreferences").document(place)
            userData.setData(["place" : place, "like" : like, "id" : id])
        } else {
            print("Error saving preference to Firestore")
            return
        }
        
    }
    
    // MARK: - FETCH PREFERENCES
    func getDestinationsPreferences() {
        guard let userEmail = user.user?.email else {
            fatalError("Error, the user is not present")
        }
        
        _ = db.collection("Users").document(userEmail).collection("PlacePreferences").addSnapshotListener({ querySnapshot, error in
            guard let preferences = querySnapshot?.documents else {
                print("Error fetching preferences: \(error!)")
                return
            }
            for preference in preferences {
                self.savedPreferences[preference["place"] as! String] = ["like" : (preference["like"] as! Bool)]
                //usen data fetcher protocol instead of user protocol. user protocol must use only user methods. data fetcher use data methids
                //                    self.user.savedPreferences[preference["place"] as! String] = ["like" : (preference["like"] as! Bool)]
            }
            
            print("======GET DESTINATIONS PREFERENECES DONE=====")
            print(self.savedPreferences.count)
            
        })//ADD LISTENER
        
    }
    
    
}
