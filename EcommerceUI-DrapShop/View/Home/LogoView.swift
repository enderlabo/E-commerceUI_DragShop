//
//  LogoView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 7/07/21.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 4){
            Text("dynamo".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image("whiteBag85")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("store".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            
        }//Hstack
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
