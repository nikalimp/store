//
//  ContentView.swift
//  store
//
//  Created by Никита Алимпиев on 09.06.2022.
//

import SwiftUI
import Firebase
import FirebaseCore

struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some View {
        Home ()
    }
}

struct ContentView_Previews: PreviewProvider {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State var show = false
    
    var body: some View{
        
        NavigationView{
            
            ZStack{
                NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show){
                    
                    Text("")
                }
                .hidden()
                
                Login(show: self.$show)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Login: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View{
        
        ZStack {
            
        
        ZStack(alignment: .topTrailing){
            GeometryReader{_ in
        VStack{
            
            Image ("LogoMain")
                .resizable().frame(width: 64, height: 64)
            Text ("Log in")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.color)
                .padding(.top, 35)
            
            TextField("Email", text: self.$email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                .padding(.top, 25)
            
            HStack(spacing: 15){
                VStack{
                    
                
                if self.visible {
                    TextField("Password", text: self.$password)
                }
                else{
                    SecureField("Password", text: self.$password)
                    }
                }
                Button(action: {
                    
                    self.visible.toggle()
                    
                }){
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.color)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("Color") : self.color, lineWidth: 2))
            .padding(.top, 25)
            
            HStack{
                Spacer()
                Button (action: {
                    
                }) {
                    Text("Forget password")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
            }
            .padding(.top, 20)
            
            Button (action: {
                
                self.verify()
                
            }) {
                Text("Log in")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top,20)
        }
        .padding(.horizontal, 25)
            }
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                Text("Registration")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
            }
            .padding()
        }
            
            if self.alert{
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    func verify() {
        if self.email != "" && self.password != "" {
           
            Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                if err != nil{
                    self.error=err!.localizedDescription
                    self.alert.toggle()
                }
                
                print("Success")
            }
        }
        else{
            self.error = "Please fill all contents properly"
            self.alert.toggle()
        }
    }
}

struct SignUp: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var repassword = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    
    var body: some View{
        
        ZStack(alignment: .topLeading){
            GeometryReader{_ in
        VStack{
            
            Image ("LogoMain")
                .resizable().frame(width: 64, height: 64)
            Text ("Log in")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.color)
                .padding(.top, 35)
            
            TextField("Email", text: self.$email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                .padding(.top, 25)
            
            HStack(spacing: 15){
                VStack{
                    
                
                if self.visible {
                    TextField("Password", text: self.$password)
                }
                else{
                    SecureField("Password", text: self.$password)
                    }
                }
                Button(action: {
                    
                    self.visible.toggle()
                    
                }){
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.color)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("Color") : self.color, lineWidth: 2))
            .padding(.top, 25)
            
            HStack(spacing: 15){
                VStack{
                    
                
                if self.revisible {
                    TextField("Re-enter", text: self.$repassword)
                }
                else{
                    SecureField("Re-enter", text: self.$repassword)
                    }
                }
                Button(action: {
                    
                    self.revisible.toggle()
                    
                }){
                    Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(self.color)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("Color") : self.color, lineWidth: 2))
            .padding(.top, 25)
            
            HStack{
                Spacer()
                Button (action: {
                    
                }) {
                    Text("Forget password")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
            }
            .padding(.top, 20)
            
            Button (action: {
                
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top,20)
        }
        .padding(.horizontal, 25)
            }
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color("Color"))
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ErrorView : View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    
    var body: some View {
        
        GeometryReader{_ in
            VStack{
                HStack{
                    Text ("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                Button(action: {
                    
                    self.alert.toggle()
                    
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical,25 )
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}
