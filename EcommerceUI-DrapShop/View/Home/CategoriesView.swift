//
//  CategoriesView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 7/07/21.
//

import SwiftUI

struct CategoriesView: View {
    var data: Int
    @Binding var index: Int
    @Binding var categoriesTitle:[String]
    
    var body: some View {
        VStack(spacing: 8){
            Text(categoriesTitle[data])
                .font(.system(size: 22))
                .fontWeight(index == data ? .bold : .none)
                .foregroundColor(Color(index == data ? "Color2" : "AccentColor"))
            
            Capsule()
                .fill(Color("Color"))
                .frame(width: 30, height: 4)
                .opacity(index == data ? 1 : 0)
            
        }//VSTACK
        .onTapGesture {
            withAnimation{
                index = data
            }
        }
    }
}

struct ProductsItem: Identifiable{
    let id = UUID()
    let title: String
    let image: String
    let amount: String
    let cardColor: String
    let price: String

}
//Products to show on DropList
var pData = [
    ProductsItem( title: "Printed Dress", image: "img1", amount: "3", cardColor: "AccentColor", price: "26.00$"),
    ProductsItem( title: "Pummer Dress", image: "img2", amount: "3", cardColor: "AccentColor", price: "26.00$"),
    ProductsItem( title: "Summer Dress", image: "img5", amount: "3", cardColor: "AccentColor", price: "19.00$"),
    ProductsItem( title: "Chiffon Dress", image: "img6", amount: "3", cardColor: "AccentColor", price: "40.00$"),
    ProductsItem( title: "Summer Dress", image: "img5", amount: "3", cardColor: "AccentColor", price: "33.00$"),
    ProductsItem( title: "Printed Dress", image: "img1", amount: "3", cardColor: "AccentColor", price: "16.00$")
]
