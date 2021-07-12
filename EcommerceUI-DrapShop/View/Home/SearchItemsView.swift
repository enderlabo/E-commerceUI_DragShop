//
//  SearchItemsView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 4/07/21.
//

import SwiftUI

struct SearchItemsView: View {
    @Binding var text: String
    @State private var isEditing: Bool = false
    
    var body: some View {
        HStack{
            TextField("Search here...", text: $text)
                .padding(15)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .foregroundColor(.black)
                .cornerRadius(8)
                .overlay(
                    HStack{
                        //Search icon
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                            .padding(.leading, 15)
                        //Close icon 'x'
                        if isEditing {
                            Button(action: {
                                self.text = " "
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color("Color"))
                                    .padding(.trailing, 8)
                            })
                        }
                    }//HStack
                ).onTapGesture {
                    self.isEditing = true
                }
            //When the textField is active, show an animtion with button 'Cancel' on right screen
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color("Color"))
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }//HStack
    }//VIEW
}

