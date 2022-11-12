//
//  CardListView.swift
//  Quizlet-ish
//
//  Created by Carolyn Liu on 11/10/22.
//

import Foundation
import SwiftUI

struct CardListView: View {
    @ObservedObject var cardListViewModel = CardListViewModel()
    @State var showForm = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    GeometryReader { geometry in
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(cardListViewModel.cardViewModels) { cardViewModel in
                                    CardView(cardViewModel: cardViewModel)
                                        .padding([.leading, .trailing])
                                }
                            }.frame(height: geometry.size.height)
                        }
                    }
                }
                Spacer()
            }
            .sheet(isPresented: $showForm) {
                NewCardForm(cardListViewModel: CardListViewModel())
            }
            navigationBarTitle("💯 Quizlet-ish")
                .navigationBarItems(trailing: Button(action: { showForm.toggle()}) {
                    Image(systemName: "plus")
                        .font(.title)
                })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
