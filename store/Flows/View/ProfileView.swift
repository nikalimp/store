//
//  ProfileView.swift
//  store
//
//  Created by Никита Алимпиев on 24.07.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaActionAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "face.smiling")
                    .resizable().frame(width: 60, height: 60)
                    .onTapGesture {
                        isAvaActionAlertPresented.toggle()
                    }.confirmationDialog("Откуда взять фото?", isPresented: $isAvaActionAlertPresented) {
                        Button {
                            print("Library")
                            }label:{
                            Text("Из галереи")
                            }
                        Button {
                            print("Camera")
                            }label:{
                            Text("С камеры")
                            }
                    }
                VStack(alignment: .leading) {
                    Text("Аркадий Афанасьевич").font(.title2)
                    Text("+7 (999) 999-99-99").font(.title3)
                }}
            Text("Россия, Свердловская область, г. Екатеринбург, ул. Московская, д.12. кв. 24")
        
        
    List {
        Text("Ваши заказы будут тут")
    }.listStyle(.plain)
        
        Button{
            isQuitAlertPresented.toggle()
        } label: {
            Text("Выйти")
                .padding().background(Color.blue).cornerRadius(30).foregroundColor(.white)
        }.padding()
                .confirmationDialog("Действительно хотите выйти?", isPresented: $isQuitAlertPresented){
                    
                    Button {
                        isAuthViewPresented.toggle()
                        }label:{
                        Text("Да")
                        }
                    
                }
//                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil){
//
//                AuthView()
//
//                }
            
        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
