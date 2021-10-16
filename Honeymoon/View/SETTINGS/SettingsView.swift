//
//  SettingsView.swift
//  Honeymoon
//
//  Created by  Cristiano on 26/9/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showsInfo: Bool = true


    
    
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 20) {
            
            HStack {
                Button {
                    showsInfo = true
                    audioFXPlayer.playSoundClick()
                    haptic.impactOccurred()
                } label: {
                    Image(systemName: "info.circle")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                }
                .accentColor(showsInfo ? .pink : .primary)
                
                Spacer()
                
                HeaderComponent()
                
                Spacer()
                
                Button {
                    showsInfo = false
                    audioFXPlayer.playSoundClick()
                    haptic.impactOccurred()
                } label: {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                }
                .accentColor(showsInfo ? .primary : .pink)
            }
            .padding()
            

            if showsInfo {
                InfoView()
            } else {
                GuideView()
            }
            
        }
        
        
        
        
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}



