//
//  FooterView.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//

import SwiftUI

struct FooterView: View {
    @EnvironmentObject var session: SessionStore
    @Binding var showBookingAlert: Bool


    
    
    
    var body: some View {
        
 
            HStack {
                NavigationLink(
                    destination: DislikedView(savedPreferences: session.savedPreferences, destinations: destinationsArray),
                    label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.pink)
                            .font(.system(size: 42, weight: .light, design: .rounded))
                    })

                
                Spacer()
                Button {
                    audioFXPlayer.playSoundClick()
                    feedback.notificationOccurred(.success)
                    showBookingAlert.toggle()
                } label: {
                    Text("Book Destination".uppercased())
                        .fontWeight(.heavy)
                        .modifier(StrokeButtonModifier())
    
                }
                
                
                Spacer()
                NavigationLink(
                    destination: LikedView(savedPreferences: session.savedPreferences, destinations: destinationsArray),
                    label: {
                        Image(systemName: "heart.circle")
                            .foregroundColor(.pink)
                            .font(.system(size: 42, weight: .light, design: .rounded))
                    })

            }
            .alert("SUCCESS", isPresented: $showBookingAlert, actions: {
                Button {
                    showBookingAlert.toggle()
                } label: {
                    Text("Happy Honeymoon!")
                }
            }, message: {
                Text("Wishing a lovely and most precious of the times together for the amazing couple.")
            })
            
            
            
        
        
        
        
        
        
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var placeholder: Bool = false

    static var previews: some View {
        FooterView(showBookingAlert: $placeholder).environmentObject(SessionStore())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
