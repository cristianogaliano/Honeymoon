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
    //FIREBASE
    @ObservedObject var user = UserAuth.shared
    @EnvironmentObject var dataSource: DataSource

    //FACEID
    @AppStorage("faceIDIsOn") var faceIDIsOn: Bool = false
    @AppStorage("userEmailUserDefaults") var userEmailUserDefaults: String = ""
    @AppStorage("passwordUserDefaults") var passwordUserDefaults: String = ""
    
    //ERROR
    @State private var errorMessage: String = ""
    @State private var showErrorAlert: Bool = false
    
    
    var body: some View {
        NavigationView {
            if user.userPresent {
                ContentView()
                    .onAppear {
                        DispatchQueue.main.async {
                            dataSource.getDestinationsPreferences()
                        }
                    }
            } else {
                WelcomeView()
            }
            
        }
        .accentColor(.white)
        .onAppear(perform: {
//            if faceIDIsOn {
//                faceID.authenticateWithFaceID()
//                if faceID.recognized {
//                    print("YEEEESSS")
//                } else {
//                    print("NOOOPE")
//                }
//            }
            user.listen()
        })
        
        //ERROR ALERT
        .alert("Error", isPresented: $showErrorAlert,
               actions: {
            Button {
                showErrorAlert.toggle()
            } label: {
                Text("OK")
            }
        }, message: {
            Text(errorMessage)
        })//ERROR ALERT
        
        .navigationBarHidden(true)
    }
    
    
    
    
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
        user.signIn(email: username, password: password) { result, error in
            if error != nil {
                //Wrong credentials in the userdefaults
                user.errorMessage = "Username and passwod in archive for FaceID results not matching with your registered logIN. Please logIn manually without FaceID, \(String(describing: error?.localizedDescription))"
                showErrorAlert.toggle()
            } else {
                //UserEmail not verified, bounce back the login
                if !result!.user.isEmailVerified {
                    user.errorMessage = "Please verify your email."
                    showErrorAlert.toggle()
                } else {
                    print("LOGIN SUCCESS!")
                    user.userPresent = true
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(UserAuth())
    }
}
