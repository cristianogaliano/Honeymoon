//
//  InfoView.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//

import SwiftUI
import LocalAuthentication

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("faceIDIsOn") var faceIDIsOn: Bool = false
    let laContext = LAContext()
    
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 20) {
                                
                Text("Settings")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                    Toggle(isOn: $faceIDIsOn) {
                        Text("FaceID")
                    }
                }

                Text("App Info!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Spacer(minLength: 10)
                
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("ok".uppercased())
                        .modifier(DismissButtonModifier())
                }
                
                
            }//VSTACK
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }//SCROLL
        
        
        
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}





