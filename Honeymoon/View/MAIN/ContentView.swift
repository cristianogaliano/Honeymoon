//
//  ContentView.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/19/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    //ENVIRONMENT
    @EnvironmentObject var dataSource: DataSource

    
    // MARK: - BINDING SHEETS
    @State private var errorMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var showSettings: Bool = false
    @State private var showInfo: Bool = false
    @State private var errorShowing: Bool = false
    
    // MARK: - CARDS LOGIC&GESTURE
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    @State private var cardViews: [CardView] = {
        var views = [CardView]()
        for i in 0..<2 {
            views.append(CardView(destination: destinationsGlobal[i]))
        }
        return views
    }()
    
    


    
    private func moveCards() {
        cardViews.removeFirst()
        lastCardIndex += 1
        let nextCard = destinationsGlobal[lastCardIndex % destinationsGlobal.count]
        let newCardView = CardView(destination: nextCard)
        cardViews.append(newCardView)
    }
    
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else { return false }
        return index == 0
    }
    
    
    
    
    
    //MARK: - DRAG STATES
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
        
    }
        
    
    
    
    
    
    
    // MARK: - BODY
    var body: some View {

        VStack {
            //MARK: - HEADER
            HeaderView(showSettings: $showSettings)
                .padding(.horizontal)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(Animation.default, value: dragState.isDragging)
            
            Spacer()

            //MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack{
                                //XMARK ON CARDVIEW
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
                                    .animation(Animation.default, value: dragState.translation.width)
                                    .modifier(CardMarkModifier())
                                
                                //HEART ON CARDVIEW
                                Image(systemName: "heart.circle")
                                    .resizable()
                                    .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
                                    .animation(Animation.default, value: dragState.translation.width)
                                    .modifier(CardMarkModifier())
                            })
                        .offset(
                            x: isTopCard(cardView: cardView) ? dragState.translation.width : 0,
                            y: isTopCard(cardView: cardView) ? dragState.translation.height : 0)
                        .scaleEffect(isTopCard(cardView: cardView) && dragState.isDragging ? 0.75 : 1)
                        .rotationEffect(isTopCard(cardView: cardView) ? Angle(degrees: Double(dragState.translation.width / 12)) : Angle(degrees: 0.0))
                        .animation(Animation.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating($dragState, body: { value, state, transaction in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })//UPDATING
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else { return }
                                    if drag.translation.width < -dragAreaThreshold {
                                        cardRemovalTransition = AnyTransition.leadingBottom
                                    }
                                    if drag.translation.width > dragAreaThreshold {
                                        cardRemovalTransition = AnyTransition.trailingBottom
                                    }
                                })// ON CHANGED
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else { return }
                                    if drag.translation.width < -dragAreaThreshold {
                                        audioFXPlayer.playSoundClick()
                                        haptic.impactOccurred()
                                        dataSource.savePreference(of: cardView, like: false)
                                        moveCards()
                                    }
                                    if drag.translation.width > dragAreaThreshold {
                                        audioFXPlayer.playSoundRise()
                                        feedback.notificationOccurred(.success)
                                        dataSource.savePreference(of: cardView, like: true)
                                        moveCards()
                                    }
                                })//ON ENDED
                        )//GESTURE
                        .transition(cardRemovalTransition)
                }//LOOP CARD
            }
            .padding(.horizontal)
            
            Spacer()
            
            
            
            //MARK: - FOOTER
            
            FooterView(showBookingAlert: $showAlert)
                .padding(.horizontal)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(Animation.default, value: dragState.isDragging)
        }//VSTACK
        .navigationBarHidden(true)
        .alert(isPresented: $errorShowing) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }//ALERT
        
        
    }//BODY
    
    

    
    
    
}

struct ContentView_Previews: PreviewProvider {

    
    static var previews: some View {
        
        ContentView()
            .environmentObject(DataSource())

    }
}
