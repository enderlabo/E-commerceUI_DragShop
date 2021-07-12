//
//  LoginView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 5/07/21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var color: Color = Color.black.opacity(0.7)
    @State var email: String = ""
    @State var pass: String = ""
    @State var visible: Bool = false
    @State var alert: Bool = false
    @State var error: String = ""
    @Binding var show: Bool
    
    
    var body: some View {
        ZStack{
            
            ZStack(alignment: .topTrailing){
                GeometryReader{ _ in
                    VStack{
                        Image("whiteBag")
                            .padding(.top, 100)
                        
                        Text("Welcome to DYNAMO")
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
                        
                        HStack{
                            Spacer()
                            
                            Button(action: {
                                self.resetPass()
                            }) {
                                Text("Forget password?")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                            .padding(.top, 20)
                            
                            
                        }//HSTACK
                        Button(action: {
                            self.validateForm()
                        }) {
                            Text("Login")
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
                    //Btn Register
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }//ZSTACK
            
            if self.alert{
                ErrorPopUpView(alert: self.$alert, error: self.$error)
            }
        }//ZSTACK
        
    }
    
    func validateForm(){
        if self.email != "" && self.pass != "" {
            Auth.auth().signIn(withEmail: self.email, password: self.pass){ (res, err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("Success")
                UserDefaults.standard.set(true, forKey: K.UserDefaultsStandardValue)
                NotificationCenter.default.post(name: NSNotification.Name(K.UserDefaultsStandardValue), object:  nil)
            }
        } else {
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
    
    func resetPass(){
        if self.email != ""{
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { err in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                self.error = "RESET"
                self.alert.toggle()
            }
        } else{
            self.error = "Email id is empty"
            self.alert.toggle()
        }
    }
    
}

