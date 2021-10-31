
import SwiftUI
import Firebase
import Combine




class UserAuth: ObservableObject {
    public static let shared = UserAuth()
    
    var didChange = PassthroughSubject<UserAuth, Never>()
    var handle: AuthStateDidChangeListenerHandle?
    @Published var user: User? { didSet { self.didChange.send(self) }}
    @Published var userPresent: Bool = false

    
    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let safeUser = user {
                // if we have a user, create a new user model
                self.user = User(
                    uid: safeUser.uid,
                    email: safeUser.email
                )
                print("Listening: \(safeUser.email ?? "Unknown")")
            } else {
                // if we don't have a user, set our session to nil
                self.user = nil
                self.userPresent = false
                print("No Got user to listen")
            }
        }
    }
    
    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
         Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut () -> Bool {
        do {
            print("SIGN OUT")
            try Auth.auth().signOut()
            self.user = nil
            return false
        } catch {
            return true
        }
        
    }
    func unListen () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}


class User {
    var uid: String
    var email: String?
    
    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email
    }
    
}

