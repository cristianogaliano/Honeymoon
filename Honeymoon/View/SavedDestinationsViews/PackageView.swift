//
//  PackageView.swift
//  Honeymoon
//
//  Created by  Cristiano on 26/9/21.
//

import SwiftUI

struct PackageView: View {
    var promotion: Promotion
    @State private var animation: Bool = false

    var body: some View {
        
        
                HStack {
                    VStack(alignment: .leading, spacing: 6, content: {
                        Text(promotion.title)
                            .padding(10)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.pink)
                        Text(promotion.description)
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                    })
                    Spacer()
                }//HSTACK PROMOTIONS
                .background(RoundedRectangle(cornerRadius: 20, style: .continuous).foregroundColor(Color(UIColor.tertiarySystemBackground)).opacity(0.8))
                .padding()
                .overlay(
                    Text(promotion.price)
                        .rotationEffect(Angle(degrees: animation ? 10 : -10))
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .padding(40)
                        .foregroundColor(.orange)
                        .animation(Animation.easeInOut(duration: 1).repeatCount(8), value: animation)
                        .onAppear(perform: {
                            withAnimation {
                                animation.toggle()
                            }
                        })
                    , alignment: .topTrailing)
                
                
                
                
                
                
    }
}

struct PackageView_Previews: PreviewProvider {
    static var previews: some View {
        PackageView(promotion: demoDestinations[0].promotions[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
