//
//  ContentView.swift
//  iDinee
//
//  Created by Alan Santoso on 13/10/20.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView{
            List{
                ForEach(menu){ section in
                    Section.init(header: Text(section.name)) {
                        ForEach(section.items){ item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        ContentView().environmentObject(order)
    }
}
