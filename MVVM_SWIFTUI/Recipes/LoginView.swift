//
//  LoginView.swift
//  MVVM_SWIFTUI
//
//  Created by Renato on 03/02/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var model: LoginViewModel
    
    init(model: LoginViewModel) {
        self.model = model
    }
    
    var body: some View {
        Form{
            Section(footer: formFooter){
                TextField("Insira seu e-mail", text: model.bindings.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                SecureField("Password", text: model.bindings.password)
            } //end Section
        } //end Form
        
        .navigationTitle("Login")
        .navigationBarItems(trailing: submitButton)
        .disabled(model.state.isLoggingIn)
        .alert(isPresented: model.bindings.isShowingErrorAlert){
            Alert(title: Text("Error ao fazer login"),
                  message: Text("Verifique seu e-mail e senha e tente novamente.")
            )
        } //end .alert
    }//end var body
    
    private var submitButton: some View{
        Button(action: model.login) {
            Text("Entrar")
        } //end Button
        .disabled(model.state.canSubmit == false )
    } //end private var submitButton
    
    private var formFooter: some View {
        Text(model.state.footerMessage)
    } //end private var formFooter
    
    
    
} //end struct LoginView


struct LoginViewState: Equatable{
    var email: String = ""
    var password: String = ""
    var isLoggingIn: Bool = false
    var isShowingErrorAlert = false
    //    var isShowingErrorAlert = false {
    //        didSet {
    //            print("isShowingErrorAlert?", isShowingErrorAlert)
    //        } //end didSet
    //} //end var isShowingErrorAlert
    
} //end struct LoginViewState

extension LoginViewState {
    static let isLogingInFooter = "Fazendo login..."
    var canSubmit: Bool { email.isEmpty == false && password.isEmpty == false && isLoggingIn == false }
    var footerMessage: String { isLoggingIn ? Self.isLogingInFooter: ""}
    
} //end extension LoginViewState


final class LoginViewModel: ObservableObject{
    @Published private(set) var state: LoginViewState
    
    var bindings: (email: Binding<String>, password: Binding<String>, isShowingErrorAlert: Binding<Bool>){
        (
            email: Binding(to: \.state.email, on: self),
            password: Binding(to: \.state.password, on: self),
            isShowingErrorAlert: Binding(to: \.state.isShowingErrorAlert, on: self)
        )
    } //error var bindings
    
    init(initialState: LoginViewState = .init()){
        state = initialState
    }
    
    func login(){
        state.isLoggingIn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)){
            self.state.isLoggingIn = false
            self.state.isShowingErrorAlert = true
        } //end DispatchQueue
    } //end private func login
} //end final class LoginViewModel



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LoginView(model: .init(initialState: .init()))
        }
    }
}
