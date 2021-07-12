//
//  MainView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 08/07/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            StoreView()
                .tabItem {
                    Image(systemName: K.Main.imgSquare)
                    Text("Browser")
                        .font(.title2)
                        .fontWeight(.bold)
                        
                        
                }
            
            MapView()
                .tabItem {
                    Image(systemName: K.Main.imgMap)
                    Text("Locations")
                        .font(.title2)
                        .fontWeight(.bold)
                        
                }
        }//TabView
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
