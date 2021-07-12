//
//  StoreView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 5/07/21.
//

import SwiftUI
import Firebase

struct StoreView: View {
    @State var categoryIndex = 0
    @State var text:String = ""
    @State var caterogiesTitle = ["Woman", "Dresses", "T-Shirts", "Shoes"]
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View{
        ZStack(){
            VStack{
                NavigationBarView()
                SearchItemsView(text: $text)
                    .padding(.top, 30)
                Spacer()
                //show all categories
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 30){
                        ForEach(0..<caterogiesTitle.count, id: \.self){ data in
                            CategoriesView(data: data, index: $categoryIndex, categoriesTitle: $caterogiesTitle)
                            
                        }
                    }//HSTACK
                }//ScrollView
                .padding(.top, 30)
                //Items from store
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(pData.filter({"\($0)".contains(text) || text.isEmpty})){ item in
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                            VStack{
                                Image("\(item.image)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 150)
                                
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(item.title)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black.opacity(0.7))
                                        
                                        Text(item.amount)
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.black.opacity(0.5))
                                        
                                        Text(item.price)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black.opacity(0.7))
                                    }//VSTack
                                    Spacer()
                                }//HStack
                            }//VSTACK
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Image(systemName: "cart")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color("Color"))
                                        .padding(.top, 10)
                                )
                                .shadow(color: Color("Color").opacity(0.05), radius: 8, x:0, y: 5)

                        }//ZStack
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(Color(item.cardColor))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Color(item.cardColor).opacity(0.8), radius: 10, x:0, y: 10)
                    }
                }//LazyVGrid
                .animation(.easeIn)
                Spacer()
                   FooterView()
            }//ScrollView
            .padding(.vertical, 10)
            }//VSTACK
        }//ZStack
        .padding(.horizontal, 10)
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
