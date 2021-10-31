

import SwiftUI

struct WelcomeView: View {
    
    @State var isShowingLogin: Bool = false
    @State var isShowingRegister: Bool = false
    
    var body: some View {

        VStack {
                Text("Welcome\n to your \n next \nDestination".uppercased())
                    .font(.system(size: 30, weight: .black, design: .rounded))
                    .shadow(radius: 5)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                Image("logo-honeymoon-app")
                Spacer()
                
                NavigationLink(
                    destination: LoginView(),
                    isActive: $isShowingLogin,
                    label: {
                        Text("Log In")
                            .fontWeight(.heavy)
                            .modifier(StrokeButtonModifier(strokeWidth: 200))
                    })
                    .padding(.horizontal)
                

                NavigationLink(
                    destination: RegisterView(),
                    isActive: $isShowingRegister,
                    label: {
                        Text("Register")
                            .fontWeight(.heavy)
                            .modifier(StrokeButtonModifier(strokeWidth: 200))
                    })
                    .padding(.horizontal)
                
                
            }
            .background(Image("background"))
        
            
            
            
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
