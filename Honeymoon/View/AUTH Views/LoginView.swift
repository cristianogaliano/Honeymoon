
import SwiftUI
import Firebase
import LocalAuthentication

struct LoginView: View {
    
    //FACEID
    @AppStorage("faceIDIsOn") var faceIDIsOn: Bool = false
    @AppStorage("userEmailUserDefaults") var userEmailUserDefaults: String = ""
    @AppStorage("passwordUserDefaults") var passwordUserDefaults: String = ""
    @AppStorage("askFaceIDActivationRequest") var askFaceIDActivationRequest: Bool = true
    @State private var showFaceIDActivationRequest: Bool = false
    @State private var showFaceIDAskAgainRequest: Bool = false
    let laContect = LAContext()
    
    //ERROR
    @State private var errorMessage: String = ""
    @State private var showErrorAlert: Bool = false
    
    //LOGIN
    @State private var username: String = "cristianogaliano88@gmail.com"
    @State private var password: String = "123456"
    @State private var loginAttempt: Int = 0
    @State private var animation: Bool = false
    @State private var isSecured: Bool = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    //USER
    @ObservedObject var user = UserAuth.shared

    
    
    // MARK: - LOGIN METHOD
    func signIn() {
        user.signIn(email: username, password: password) { result, error in
            //if we have a problem
            if error != nil {
                //if the problem is wrong credentials, after 3 attempts, send a reset password email
                if error?.localizedDescription == "The password is invalid or the user does not have a password." {
                    loginAttempt += 1
                    print("login attempts failed \(loginAttempt)")
                    print("LOGIN FAILED")
                    if loginAttempt >= 3 {
                        Auth.auth().sendPasswordReset(withEmail: username) { error in
                            if error != nil {
                                errorMessage = error?.localizedDescription ?? "Unkown Error"
                                showErrorAlert.toggle()
                            } else {
                                loginAttempt = 0
                                errorMessage = "3 Login attempts failed, we have just sent you a reset password email."
                                showErrorAlert.toggle()
                            }
                        }
                    } else {
                        errorMessage = "\(String(describing: error!.localizedDescription))\nYou have used \(loginAttempt) out of 3 attempts"
                        showErrorAlert.toggle()
                    }
                } else {
                    //if the error is other than wrong credential, show an alert with the error message
                    errorMessage = error?.localizedDescription ?? "Unkown Error"
                    showErrorAlert.toggle()
                }
                
            } else {
                //UserEmail not verified, bounce back the login, inviting the user to verify the email first
                if !result!.user.isEmailVerified {
                    errorMessage = "Please verify the email that we sent you."
                    showErrorAlert.toggle()
                } else {
                    //user logged in, we now save the credentials in userdefaults to using them next time if we want to log in with faceID
                    print("LOGIN SUCCESS!")
                    passwordUserDefaults = password
                    userEmailUserDefaults = username
                    //if the device has biometrics, and if the user did not ask before to "do not ask again", we ask the user if he wants to use faceID the next time
                    if askFaceIDActivationRequest && !faceIDIsOn && laContect.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)  {
                        showFaceIDActivationRequest.toggle()
                    } else {
                        //if the user has already chosen to "do not ask again faceID", we just log in
                        user.userPresent = true
                    }
                }
                
            }
        }
    }
    
    // MARK: - BODY
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 6, content: {
            
            // MARK: - HEADER
            Text("LOG IN")
                .font(.system(size: 30, weight: .black, design: .rounded))
                .shadow(radius: 5)
                .foregroundColor(.white)
            
            Spacer()
            Image("logo-honeymoon-app")
                .scaleEffect(animation ? 1 : 2)
            
            Spacer()
            
            // MARK: - EMAIL
            VStack {
                HStack {
                    Text("EMAIL")
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .shadow(radius: 5)
                    Spacer()
                }
                
                TextField("", text: $username) { _ in
                } onCommit: {
                    signIn()
                    haptic.impactOccurred()
                }
                .foregroundColor(.white)
                .placeholder(when: username.isEmpty, alignment: .center, placeholder: {
                    Text("User name (email address)").foregroundColor(.white)
                })
                .modifier(TextfieldViewModifier())
                
            }//EMAIL VSTACK
            
            // MARK: - PASSWORD
            VStack {
                HStack {
                    Text("PASSWORD")
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .shadow(radius: 5)
                    Spacer()
                }
                ZStack(alignment: .trailing) {
                    if isSecured {
                        SecureField("", text: $password) {
                            signIn()
                            haptic.impactOccurred()
                        }
                        .placeholder(when: password.isEmpty, alignment: .center, placeholder: {
                            Text("Password").foregroundColor(.white)
                        })
                        .modifier(TextfieldViewModifier())
                    } else {
                        TextField("", text: $password) { _ in
                        } onCommit: {
                            signIn()
                            haptic.impactOccurred()
                        }
                        .foregroundColor(.white)
                        .placeholder(when: password.isEmpty, alignment: .center, placeholder: {
                            Text("Password").foregroundColor(.white)
                        })
                        .modifier(TextfieldViewModifier())
                    }
                    Button(action: {
                        haptic.impactOccurred()
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.white)
                    }
                    .padding(.horizontal, 30)
                }
                
            }//PASSWORD VSTACK
            
            
            
            // MARK: - LOGIN BUTTON
            Button(action: {
                signIn()
                feedback.notificationOccurred(.success)
            }, label: {
                Text("Log In")
                    .modifier(StrokeButtonModifier(strokeWidth: 200))
                    .padding(25)
            })//BUTTON
            
                .onAppear(perform: {withAnimation(.easeOut(duration: 1)) {animation.toggle()}})
            
            
            
            
        })//VSTACK
        
        // MARK: - ALERTS
        
        //ALERT FACEID ACTIVATION REQUEST
        //login successful, we now ask if the user wants to use faceID for the next time. we have already screened if the device has biometrics
            .alert("FaceID", isPresented: $showFaceIDActivationRequest,
                   actions: {
                Button {
                    //activate faceID and release the access to the user
                    faceIDIsOn = true
                    user.userPresent = true
                } label: {
                    Text("OK")
                }
                Button {
                    //we close this alert and we present another one asking if the user wants a reminder next time
                    showFaceIDActivationRequest = false
                    showFaceIDAskAgainRequest.toggle()
                } label: {
                    Text("NOT NOW")
                }
                
            }, message: {
                Text("Login success! \n Do you want to use FaceID next time?\nActivate FaceID?")
            })//ALERT FACEID ACTIVATION REQUEST
        
        
        //ALERT FACEID ASK AGAIN REQUEST
        //the user chose not to use faceID for now, but we now ask him if he wants us to remind this next time he login
            .alert("FaceID", isPresented: $showFaceIDAskAgainRequest,
                   actions: {
                Button {
                    //we keep track that the user wants a reminder for next time, saving this parameter in userdefaults
                    askFaceIDActivationRequest = true
                    user.userPresent = true
                } label: {
                    Text("OK")
                }
                Button {
                    //we keep track that the user does not wat a reminder for next time, saving this parameter in userdefaults. since now on, the user will have to activate faceID in the settings only
                    askFaceIDActivationRequest = false
                    showFaceIDAskAgainRequest = false
                    user.userPresent = true
                } label: {
                    Text("NO")
                }
                
            }, message: {
                Text("Do you want me to remind you FaceID request next time you login?\n You can always activate FaceID later in the settings!")
            })//ALERT FACEID ASK AGAIN REQUEST
        
        
        //ERROR ALERT reusable from this view
            .alert("Error", isPresented: $showErrorAlert,
                   actions: {
                Button("OK", role: .cancel) { }
            },
                   message: {
                Text(errorMessage)
            })//ERROR ALERT reusable from this view
        
            .background(Image("background"))
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
