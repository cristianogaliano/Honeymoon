

import SwiftUI

struct DestinationGridItemView: View {
    @EnvironmentObject var session: SessionStore
    let like: Bool
    let destination: Destination
    let columns: Int
    let city: String
    let country: String
    func reactiveTitle(with gridColumns: Int, with name: String) -> Text {
        switch gridColumns {
        case 1:
            return Text(name).font(.largeTitle)
        case 2:
            return Text(name).font(.title2)
        case 3:
            return Text(name).font(.footnote)
        default:
            return Text(name).font(.largeTitle)
        }
        
    }
    func reactiveHeadline(with gridColumns: Int, with name: String) -> Text {
        switch gridColumns {
        case 1:
            return Text(name).font(.footnote)
        case 2:
            return Text(name).font(.caption)
        case 3:
            return Text(name).font(.caption2)
        default:
            return Text(name).font(.footnote)
        }
        
    }
    

    
    var body: some View {
        
        Image(destination.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(alignment: .topTrailing) {
                Image(systemName: like ? "heart.fill" : "heart")
                     .font(.title)
                     .foregroundColor(.pink)
                     .padding(3)
                     .background(Circle().foregroundColor(.pink).opacity(0.2))
                     .padding(2)
            }//LIKE OVERLAY HEART
            .overlay(
                VStack(alignment: .center, spacing: 12, content: {
                    reactiveTitle(with: columns, with: city)
                        .foregroundColor(.white)
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
                    
                    reactiveHeadline(with: columns, with: country)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(Color.white)
                        )
                })
                    .frame(minWidth: 280)
                    .padding(.bottom, 50),
                alignment: .bottom
            )
        
        
        
        
        
        
        
        
        
    }
    
}


struct DestinationGridItemView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        DestinationGridItemView(like: true, destination: demoDestinations[0], columns: 1, city: "veligandu", country: "Maldives")
            .previewLayout(.sizeThatFits)
            .padding()
        DestinationGridItemView(like: false, destination: demoDestinations[1], columns: 1, city: "veligandu", country: "Maldives")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
