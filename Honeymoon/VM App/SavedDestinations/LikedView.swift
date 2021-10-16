//
//  LikedView.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/22/21.
//

import SwiftUI
import Firebase

struct LikedView: View {
    @EnvironmentObject var session: SessionStore
    var savedPreferences: [String: [String : Bool]]
    var destinations: [Destination]

    //GRID LAYOUT
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        switch gridColumn {
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        default:
            toolBarIcon = "grid.circle"
        }
    }
    
    
    var body: some View {
        Group {
            if !isGridViewActive {
                List {
                    ForEach(destinations, id: \.id) { destination in
                        if savedPreferences[destination.place]?["like"] == true {
                            NavigationLink(
                                    destination: DestinationPromotionsView(destination: destination),
                                    label: {
                                        DestinationListView(like: true, destination: destination)
                                    })
                        }

                    }
                }
            } else {
                EmptyView()
                ScrollView {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(destinations, id: \.id) { destination in
                            if savedPreferences[destination.place]?["like"] == true {
                                NavigationLink(
                                    destination: DestinationPromotionsView(destination: destination),
                                    label: {
                                        DestinationGridItemView(like: true, destination: destination, columns: gridColumn, city: destination.place, country: destination.country)
                                    })
                            }
                        }
                        
                    }//GRID
                    .padding(10)
                    .animation(Animation.easeIn, value: gridColumn)
                }// SCROLL
                EmptyView()
            }
    
        }//GROUP
        .navigationTitle(Text("❤️I LIKED..."))
        .animation(Animation.easeIn, value: isGridViewActive)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    //LIST BUTTON
                    Button(action: {
                        haptic.impactOccurred()
                        isGridViewActive = false
                    }, label: {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary : .pink)
                    })
                    //GRID BUTTON
                    Button(action: {
                        haptic.impactOccurred()
                        gridSwitch()
                        isGridViewActive = true
                    }, label: {
                        Image(systemName: toolBarIcon)
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .pink : .primary)
                    })
                    
                }
            }
        })//TOOLBAR

        
    }
}

struct LikedView_Previews: PreviewProvider {
    static let demoPreferences: [String : [String : Bool]] = ["Budapest": ["like": true], "Venice": ["like": false], "Seoraksan": ["like": false], "Rio de Janeiro": ["like": false], "Athens": ["like": true], "Tulum": ["like": true], "Paris": ["like": true], "Sydney": ["like": false], "High Tatras": ["like": true], "Emerald Lake": ["like": true], "Yosemite": ["like": true], "Lake Bled": ["like": true], "Krabi": ["like": true], "Grand Canyon": ["like": false], "Dubai": ["like": true], "Barcelona": ["like": false], "San Francisco": ["like": false], "London": ["like": false], "Rome": ["like": true], "New York": ["like": true], "Veligandu": ["like": false]]
    static var previews: some View {
        
        LikedView(savedPreferences: demoPreferences, destinations: demoDestinations)
            .environmentObject(SessionStore())
    }
}
