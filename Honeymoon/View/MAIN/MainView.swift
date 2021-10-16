//
//  MainView.swift
//  Honeymoon
//
//  Created by  Cristiano on 22/9/21.
//

import SwiftUI
import Firebase
import LocalAuthentication

struct MainView: View {
    
    @EnvironmentObject var session: SessionStore
    @AppStorage("FaceID") var faceID: Bool = false
    @AppStorage("userEmailUserDefaults") var userEmailUserDefaults: String = ""
    @AppStorage("passwordUserDefaults") var passwordUserDefaults: String = ""
    
    
    @State private var showErrorAlert: Bool = false
    
    
    var body: some View {
        NavigationView {
            if session.userPresent {
                ContentView()
                    .onAppear {
                        DispatchQueue.main.async {
                            fetchDestinationsPreferences()
                        }
                    }
            } else {
                WelcomeView()
            }
            
        }
        .accentColor(.white)
        .onAppear(perform: {
            if faceID {
                authenticateWithFaceID()
            }
            session.listen()
            fetchDestinationsData()
        })
        .alert("Error", isPresented: $showErrorAlert,
               actions: {
            Button {
                showErrorAlert.toggle()
            } label: {
                Text("OK")
            }
        }, message: {
            Text(session.errorMessage)
        })//ALERT FACEID ACTIVATION REQUEST
        .navigationBarHidden(true)
    }
    
    // MARK: - METHODS
    
    
    
    
    // MARK: - FACEID
    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        // FaceID authenticated successfully
                        print("FACEID AUTH SUCCESS!!!")
                        //login to firebaseAuth with stored credentials
                        signInWithFaceID(username: userEmailUserDefaults, password: passwordUserDefaults)
                    } else {
                        // there was a problem to recognize the user face or fingerprint
                        print("ID NOT RECOGNIZED!!!")
                    }
                }
            }
        } else {
            // no biometrics, this stage should not be reached, because there is a secure stage, that id the device has no biometrics, the user won't be asked to activate faceID and the FaceID toggle won't show in the settings as well
            print("THIS DEVICE HAS NO BIOMETRICS AUTH!")
            
        }
    }
    
    func signInWithFaceID(username: String, password: String) {
        session.signIn(email: username, password: password) { result, error in
            if error != nil {
                //Wrong credentials in the userdefaults
                session.errorMessage = "Username and passwod in archive for FaceID results not matching with your registered logIN. Please logIn manually without FaceID, \(String(describing: error?.localizedDescription))"
                showErrorAlert.toggle()
            } else {
                //UserEmail not verified, bounce back the login
                if !result!.user.isEmailVerified {
                    session.errorMessage = "Please verify your email."
                    showErrorAlert.toggle()
                } else {
                    print("LOGIN SUCCESS!")
                    session.userPresent = true
                }
            }
        }
    }
    
    
    
    
    
    
    // MARK: - FETCH PREFERENCES
    func fetchDestinationsPreferences() {
        if let userEmail = session.session?.email {
            
            _ = db.collection("Users").document(userEmail).collection("PlacePreferences").addSnapshotListener({ querySnapshot, error in
                guard let preferences = querySnapshot?.documents else {
                    print("Error fetching preferences: \(error!)")
                    return
                }
                for preference in preferences {
                    self.session.savedPreferences[preference["place"] as! String] = ["like" : (preference["like"] as! Bool)]
                }
                
                
                
            })//ADD LISTENER
            
        }// IF LET USEREMAIL
    }
    
    
    
    
    // MARK: - FETCH DESTINATIONS
    func fetchDestinationsData() {
        
        var promotionArray = [Promotion]()
        
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
                    
                    promotionArray = [Promotion]()
                    for promotion in promotions {
                        promotionArray.append(Promotion(
                            title: promotion["title"] as! String,
                            description: promotion["description"] as! String,
                            price: promotion["price"] as! String,
                            image: promotion["image"] as! String))}
                    
                    destinationsArray.append(Destination(
                        id: destination["id"] as! String,
                        place: destination["place"] as! String,
                        country: destination["country"] as! String,
                        image: destination["image"] as! String,
                        promotionFrom: destination["promotionFrom"] as! String,
                        promotions: promotionArray))
                    
                    
                    
                }// Promotions GETDOCUMENTS
            }//DESTINATION LOOP
            
            
        }//DESTINATIONS GETDOCUMENTS
        
        
    }//func
    
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SessionStore())
    }
}
