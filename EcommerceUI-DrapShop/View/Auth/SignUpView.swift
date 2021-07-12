//
//  SignUpView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 5/07/21.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State var color: Color = Color.black.opacity(0.7)
    @State var email: String = ""
    @State var pass: String = ""
    @State var repass: String = ""
    @State var visible: Bool = false
    @State var revisible: Bool = false
    @State var alert: Bool = false
    @State var error: String = ""
    @Binding var show: Bool
    
    
    var body: some View {
        ZStack{
            ZStack(alignment: .topLeading){
                GeometryReader{ _ in
                    VStack{
                        Image("whiteBag")
                            .padding(.top, 100)
                        
                        Text("Sign Up")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            VStack{
                                if self.visible{
                                    TextField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                } else {
                                    SecureField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                            }//VSTACK
                            Button(action: {
                                self.visible.toggle()
                            }){
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }//HSTACK
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            VStack{
                                if self.revisible{
                                    TextField("Repeat-Password", text: self.$repass)
                                        .autocapitalization(.none)
                                } else {
                                    SecureField("Repeat-Password", text: self.$repass)
                                        .autocapitalization(.none)
                                }
                            }//VSTACK
                            Button(action: {
                                self.revisible.toggle()
                            }){
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }//HSTACK
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 25)
                        
                        Button(action: {
                            self.registerForm()
                        }) {
                            Text("Register")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }//VSTACK
                    .padding(.horizontal, 25)
                }//GeometryReader
                Button(action: {
                    self.show.toggle()
                }) {
                    //Btn <- back
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }//ZSTACK
            .navigationBarBackButtonHidden(true)
            
            if self.alert{
                ErrorPopUpView(alert: self.$alert, error: self.$error)
            }
        }//ZStack
        
    }
    
    func registerForm(){
        if self.email != ""{
            if self.pass == self.repass{
                //Register new user
                Auth.auth().createUser(withEmail: self.email, password: self.pass){ (res, err) in
                    //error
                    if err != nil {
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    print("Success")
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            } else {
                self.error = "Password not matched"
                self.alert.toggle()
            }
        } else {
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
}


