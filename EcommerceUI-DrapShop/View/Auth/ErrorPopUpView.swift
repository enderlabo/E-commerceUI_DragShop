//
//  ErrorPopUpView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 5/07/21.
//

import SwiftUI

struct ErrorPopUpView: View {
    @State var color: Color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    
    var body: some View {
        GeometryReader{_ in
            VStack{
                HStack{
                    Text(self.error == "RESET" ?  "Message" : "Error")
                        .font(.title)
                        .foregroundColor(self.color)
                        .fontWeight(.bold)
                    
                    Spacer()
                }//HSTACK
                .padding(.horizontal, 25)
                
                Text(self.error == "RESET" ? "Password reset link has been send succesfully" : self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                    
                
                Button(action:{
                    self.alert.toggle()
                } ){
                    Text(self.error == "RESET" ? "Ok" : "Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
            }//VSTACK
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.top, 200)
           
        }//GeometryReader
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
        
    }
}


