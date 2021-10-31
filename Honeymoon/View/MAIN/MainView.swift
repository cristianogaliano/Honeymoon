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
    //ENVIRONMENT
    @ObservedObject var user = UserAuth.shared
    @ObservedObject var faceID = FaceID.shared
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
            if faceIDIsOn {
                faceID.authenticateWithFaceID(completionSignIn: signInWithFaceID(username: userEmailUserDefaults, password: passwordUserDefaults))
            }
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
    
    
    
    

    
    func signInWithFaceID(username: String, password: String) {
            print("SIGNINWITHFACEID CALLED")
            user.signIn(email: username, password: password) { result, error in
                if error != nil {
                    //Wrong credentials in the userdefaults
                    errorMessage = "Username and passwod in archive for FaceID results not matching with your registered logIN. Please logIn manually without FaceID, \(String(describing: error?.localizedDescription))"
                    showErrorAlert.toggle()
                } else {
                    //UserEmail not verified, bounce back the login
                    if !result!.user.isEmailVerified {
                        errorMessage = "Please verify your email."
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
        MainView()
    }
}
