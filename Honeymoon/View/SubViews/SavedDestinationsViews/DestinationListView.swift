

import SwiftUI

struct DestinationListView: View {
    let like: Bool
    let destination: DestinationProtocol

    
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(destination.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(alignment: .topTrailing) {
                    if like {
                        Image(systemName: "heart.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.pink)
                            .padding(5)
                    } else {
                        Image(systemName: "heart")
                            .font(.body)
                            .foregroundColor(.pink)
                            .padding(3)
                            .background(Circle().foregroundColor(.pink).opacity(0.2))
                            .padding(2)
                    }

                }//LIKE OVERLAY HEART
  
            VStack(alignment: .leading, spacing: 8) {
                Text(destination.place)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.pink)
                Text(destination.country)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                
            }// VSTACK
            
        }// HSTACK
    }
    
}


struct DestinationListView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        DestinationListView(like: true, destination: DestinationsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
        DestinationListView(like: false, destination: DestinationsData[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
