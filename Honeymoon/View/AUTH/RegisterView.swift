
import SwiftUI
import Firebase

struct RegisterView: View {
    
    //REGISTER
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorSignup: Bool = false
    @State private var emailSent: Bool = false
    @State private var animation: Bool = false
    @State private var isSecured: Bool = true
    
    
    //USER
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    // MARK: - SIGNUP METHOD
    //SignUp with mandatory email verification. Will be requested to login after the email is verified.
    func signUp() {
        session.signUp(email: username, password: password) { result, error in
            
            if error != nil {
                //SHOW ALERT WITH ERROR
                session.errorMessage = error?.localizedDescription ?? "Unkown Error"
                errorSignup.toggle()
                //                }
            } else {
                //NO ERROR
                //EMAIL VERIFICATION
                // if the user is not verified yet, he will get a verification email and a popup alert with usual instructions, and then the view will move back
                if !result!.user.isEmailVerified {
                    print("USER NOT VERIFIED")
                    result?.user.sendEmailVerification(completion: { error in
                        if error != nil {
                            print("ERROR, IN SENDING VERIFICATION EMAIL!")
                            session.errorMessage = error?.localizedDescription ?? "Unkown Error"
                            errorSignup.toggle()
                            return
                        } else {
                            print("VERIFICATION EMAIL SENT!")
                            emailSent = true
                            session.errorMessage = "We have just sent you a verification email, please verify your details and logIn to Honeymoon and start browsing your nect destination!"
                            errorSignup.toggle()
                        }
                    })
                } else {
                    // a verified user, means that it is already refistered, so it should have already received an error from firebase displaying that the user is already existent and it should just login rather then register. I wouldn't thow a fatal error, but i would rather show the loginview. The app wouldn't anyway crash.
                }
                
            }
        }
        
    }
    
    var body: some View {
        VStack {
            
            // MARK: - HEADER
            Text("REGISTRATION")
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
                    signUp()
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
                            signUp()
                            haptic.impactOccurred()
                        }
                        .placeholder(when: password.isEmpty, alignment: .center, placeholder: {
                            Text("Password").foregroundColor(.white)
                        })
                        .modifier(TextfieldViewModifier())
                    } else {
                        TextField("", text: $password) { _ in
                        } onCommit: {
                            signUp()
                            haptic.impactOccurred()
                        }
                        .foregroundColor(.white)
                        .placeholder(when: password.isEmpty, alignment: .center, placeholder: {
                            Text("Password").foregroundColor(.white)
                        })
                        .modifier(TextfieldViewModifier())
                    }
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.white)
                    }
                    .padding(.horizontal, 30)
                }
            }//PASSWORD VSTACK
            
            // MARK: - REFISTER BUTTON
            Button(action: {
                signUp()
                feedback.notificationOccurred(.success)
            }, label: {
                Text("Register")
                    .modifier(StrokeButtonModifier(strokeWidth: 200))
                    .padding(25)
            })//REGISTER BUTTON
            
        }//VSTACK
        .onAppear(perform: {withAnimation(.easeOut(duration: 1)) {animation.toggle()}})
        .background(Image("background"))
        //ALERT for eventual errors, used also as notification for VerificationEmailSent and if so, opens LoginView
        .alert(isPresented: $errorSignup) {
            Alert(
                title: Text(emailSent ? "VERIFICATION EMAIL SENT!" : "Error"),
                message: Text(session.errorMessage),
                dismissButton: .default(Text("OK"), action: {
                    if emailSent {
                        presentationMode.wrappedValue.dismiss()
                    }
                })
            )
        }//ALERT
        
        
    }
    
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
