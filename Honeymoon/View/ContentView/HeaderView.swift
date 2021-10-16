//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showSettings: Bool
    @EnvironmentObject var session: SessionStore
    
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    session.signOut()
                    playSound(file: "sound-click", type: "mp3")
                    feedback.notificationOccurred(.warning)
                } label: {
                    Image(systemName: "person.crop.circle.badge.xmark")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                }
                .accentColor(.primary)
                
                Spacer()
                
                Image("logo-honeymoon-pink")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                
                Spacer()
                
                
                Button {
                    playSound(file: "sound-click", type: "mp3")
                    haptic.impactOccurred()
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gear")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                }
                .accentColor(.primary)
                
                
                
            }//HSTACK
            .sheet(isPresented: $showSettings, content: {
                SettingsView()
            })

        }//VSTACK
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var placeholder: Bool = false
    
    static var previews: some View {
        
        HeaderView(showSettings: $placeholder)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
