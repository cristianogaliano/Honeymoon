//
//  HoneymoonApp.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/19/21.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
    @EnvironmentObject var session: SessionStore




    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Firestore.firestore()
        return true
    }
}



@main
struct HoneymoonApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @EnvironmentObject var session: SessionStore
    @AppStorage("FaceID") var faceID: Bool = false
    @AppStorage("userEmailUserDefaults") var userEmailUserDefaults: String = ""
    @AppStorage("passwordUserDefaults") var passwordUserDefaults: String = ""
    @AppStorage("askFaceIDActivationRequest") var askFaceIDActivationRequest: Bool = true
    
    var body: some Scene {
        
        WindowGroup {
            MainView().environmentObject(SessionStore())
//                .onAppear {
//                DispatchQueue.main.async {
//                  //   COMMENTED OUT, USED ONLY THE FIRST TIME TO CREATE THE FIRESTORE DATABASE
//                    print("==========INITIALIZING DATABASE===========")
//                    initDataFirestore()
//                }
//            }
        }
    }
    

    
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
