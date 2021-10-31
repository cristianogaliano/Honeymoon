//
//  DestinationPromotionsView.swift
//  Honeymoon
//
//  Created by  Cristiano on 20/9/21.
//

import SwiftUI

struct DestinationPromotionsView: View {
    let destination: DestinationProtocol
    
    
    
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .center, spacing: 10) {
                Text(destination.place.uppercased())
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .shadow(radius: 1)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 4)
                    .overlay(
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 1),
                        alignment: .bottom
                    )
                
                Text(destination.country.uppercased())
                    .foregroundColor(.black)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .frame(minWidth: 85)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.white)
                    )
                    .padding(.bottom, 2)
            }//VSTACK HEADER
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous).foregroundColor(Color(UIColor.tertiarySystemBackground)).opacity(0.5))
            
            ScrollView {
                ForEach(destination.promotions, id: \.title) { promotion in

                    PackageView(promotion: promotion)
                    
                    
                    
                }//LOOP
            }//LIST PROMOTIONS
            
            
            
            
            
            
            Spacer()
            
        }//VSTACK MAIN
        .background(Image(destination.image))
        
    }//BODY
}

struct DestinationPromotionsView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationPromotionsView(destination: DestinationsData[0])
    }
}
