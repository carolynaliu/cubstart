//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Items: Identifiable {
    
    let imageName: String
    let itemName: String
    let quantity: String
    
    init(imageName: String, itemName: String, quantity: String) {
        self.imageName = imageName
        self.itemName = itemName
        self.quantity = quantity
    }
}

struct ContentView: View {
    
    var fruitList = [Items(imageName: "banana", itemName: "Bananas", quantity: "3"), Items(imageName: "apple", itemName: "Apples", quantity: "4")]
    
    var veggiesList = [Items(imageName: "bellpepper", itemName: "Bell Pepper", quantity: "5"), Items(imageName: "potato", itemName: "Potato", quantity: "4"), Items(imageName: "broccoli", itemName: "Broccoli", quantity: "2")]
    
    var proteinList = [Items(imageName: "eggs", itemName: "Eggs", quantity: "12"), Items(imageName: "tofu", itemName: "Tofu", quantity: "1")]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fruits")) {
                    ForEach(fruitList) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Veggies")) {
                    ForEach(veggiesList) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Proteins")) {
                    ForEach(proteinList) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
            }
            .navigationTitle("Shopping List")
        }
    }
}
