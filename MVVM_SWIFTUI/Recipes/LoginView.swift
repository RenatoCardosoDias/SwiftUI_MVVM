//
//  LoginView.swift
//  MVVM_SWIFTUI
//
//  Created by Renato on 03/02/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggingIn: Bool = false
    
    var body: some View {
        Form{
            Section(footer: formFooter){
                TextField("Insira seu e-mail", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
            } //end Section
        } //end Form
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                submitButton
            } //end ToolbarItem
        } //end .toolbar
            .navigationTitle("Login")
            .disabled(isLoggingIn)
    }//end var body
    
    private var submitButton: some View{
        Button(action: login) {
            Text("Entrar")
        } //end Button
        .disabled(email.isEmpty || password.isEmpty)
    } //end private var submitButton
    
    private var formFooter: some View {
        Text(isLoggingIn ? "Fazendo login.." : "")
    } //end private var formFooter
    
    private func login(){
        isLoggingIn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)){
            isLoggingIn = false
        }
    }

} //end struct LoginView

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            LoginView()
        }
    }
}
