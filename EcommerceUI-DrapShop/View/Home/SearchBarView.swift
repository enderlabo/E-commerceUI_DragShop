//
//  SearchBarView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 4/07/21.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
                             GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
                             GridItem(.flexible(minimum: 100, maximum: 200))],
                          spacing:12, content: {
                    ForEach(0..<19, id: \.self) { num in
                        HStack{
                            Spacer()
                            Text("\(num)")
                            Spacer()
                        }//HStack
                        .padding()
                        .background(Color.pink)
                    }
                })//LazyVGrid
                    //fixed margin left and right to each item from grid.
                    .padding(.horizontal, 12)
                
            }.navigationTitle("Grid SearchView")
        }//NavigationView
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
