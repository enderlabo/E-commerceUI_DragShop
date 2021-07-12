//
//  FooterView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 4/07/21.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
            Text("Fashion has been creating well-designed collections since 2010. The brand offers feminine designs delivering stylish separates and statement dresses which has since evolved into a full ready-to-wear collection in which every item is a vital part of a woman's wardrobe.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            
            Image("cart")
                .renderingMode(.template)
                .foregroundColor(Color(.black).opacity(0.7))
                .layoutPriority(0)
            
                Text("© 2021 - Elderson Laborit\nAll right reserved")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .layoutPriority(1)
        }//VStack
        .padding(.top, 50)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
