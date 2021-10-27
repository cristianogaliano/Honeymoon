//
//  FaceID.swift
//  Honeymoon
//
//  Created by  Cristiano on 16/10/21.
//

import SwiftUI
import LocalAuthentication


let faceID = FaceID()

class FaceID {
    
    @Published var recognized: Bool = false
    
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
                    self.recognized = success
                    if success {
                        // user recognized
                        print("FaceID RECOGNIZED!!!")
                    } else {
                        // there was a problem to recognize the user face or fingerprint
                        print("FaceD NOT RECOGNIZED!!!")
                    }
                }
            }
        } else {
            // no biometrics, this stage should not be reached, because there is a secure stage, that id the device has no biometrics, the user won't be asked to activate faceID and the FaceID toggle won't show in the settings as well
            print("THIS DEVICE HAS NO BIOMETRICS AUTH!")
            
        }
    }
}



