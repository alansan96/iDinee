//
//  ItemRow.swift
//  iDinee
//
//  Created by Alan Santoso on 13/10/20.
//

import SwiftUI

struct ItemRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var item: MenuItem
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)){
            HStack{
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack(alignment: .leading, content: {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }).layoutPriority(1)
                Spacer()
                ForEach(item.restrictions, id: \.self) {restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction])
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
