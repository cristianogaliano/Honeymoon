//
//  UserModel+Protocol.swift
//  Honeymoon
//
//  Created by  Cristiano on 19/10/21.
//

import Foundation
import Firebase

protocol Logging { }

extension Logging {
    
    func listen() {
        UserAuth.shared.listen()
    }
    
    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) { UserAuth.shared.signUp(email: email, password: password, handler: handler) }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) { UserAuth.shared.signIn(email: email, password: password, handler: handler) }
    
    func signOut() -> Bool {
        return UserAuth.shared.signOut()
    }
    
    func unListen () {
        UserAuth.shared.unListen()
    }
    
}
