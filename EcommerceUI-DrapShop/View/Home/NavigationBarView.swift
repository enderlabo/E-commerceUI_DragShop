//
//  NavigationBarView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 4/07/21.
//

import SwiftUI
import Firebase

struct NavigationBarView: View {
    //MARK: - Properties
    @State private var isAnimated: Bool = false
    
    //MARK: - Body
    var body: some View {
        HStack{
            Button(action: {
                try! Auth.auth().signOut()
                
                UserDefaults.standard.set(false, forKey: K.UserDefaultsStandardValue)
                NotificationCenter.default.post(name: NSNotification.Name(K.UserDefaultsStandardValue), object: nil)
            }, label: {
                Image(systemName: "u.circle.fill")
                    .font(.title)
                    .foregroundColor(Color("Color"))
            })//:Button
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)){
                        isAnimated.toggle()
                    }
                })
            Spacer()
            
            Button(action: {}, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                //Bubble of fake notification.
                Circle()
                    .fill(Color.red)
                    .frame(width: 14, height: 14, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x:13, y: -13)
                }
            })//:Button
        }//:HSTACK
    }
}

//MARK: - Preview
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
