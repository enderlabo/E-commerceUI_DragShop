//
//  HomeStoreView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 7/07/21.
//

import SwiftUI

struct HomeStoreView: View {
    var body: some View {
        ZStack{
            VStack{
                NavigationBarView()
                SearchItemsView(text: .constant(""))
                    .padding(.top, 30)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 30){
                        ForEach(0..< id: \.self)
                    }//HSTACK
                }//ScrollView
                ZStack(alignment: .topLeading){
                    GeometryReader{ _ in
                        
                        VStack{
                            Text("Welcome Dynamo Store")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black.opacity(0.7))
                            
                            Button(action: {
                                try! Auth.auth().signOut()
                                UserDefaults.standard.set(false, forKey: "status")
                                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                            }) {
                                Text("Log out")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 50)
                            }
                            .background(Color("Color"))
                            .cornerRadius(10)
                            .padding(.top, 25)
                        }//VStack
                }//ZStack
            }//ZSTACK
            }//VSTACK
        }//ZStack
    }
}

struct HomeStoreView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStoreView()
    }
}
