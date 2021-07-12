//
//  ContentView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 4/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        Home()
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var show: Bool = false    
    @State var status = UserDefaults.standard.value(forKey: K.UserDefaultsStandardValue) as? Bool ?? false
    
    var body: some View{
        NavigationView{
            VStack{
                if self.status {
                    MainView( )
                } else {
                    ZStack{
                        NavigationLink(
                            destination: SignUpView(show: self.$show),
                            isActive: self.$show){
                            Text("")
                            }
                        .hidden()

                        LoginView(show: self.$show)
                        }//ZSTACK
                }
            }
            }//NavigationView
        .padding(.top, -90)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name(K.UserDefaultsStandardValue), object: nil, queue: .main){ (_) in
                self.status = UserDefaults.standard.value(forKey: K.UserDefaultsStandardValue) as? Bool ?? false
                
            }
        }

        }
    }
    
}
