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
    let databaseInitializer = InitFirestoreDatabase()
    var body: some Scene {
        
        WindowGroup {
            MainView().environmentObject(SessionStore())
            
            //                  // =============================================================================
            //                  //   COMMENTED OUT, USED ONLY THE FIRST TIME TO CREATE THE FIRESTORE DATABASE
            //                .onAppear {
            //                DispatchQueue.main.async {
            //                    print("==========INITIALIZING DATABASE===========")
            //                    databaseInitializer.initDataFirestore()
            //                }
            //            }//onAppear INITDATABASE
            //                  // =============================================================================
        }
    }
    
    
    
    
    
    
}
