//
//  LoginView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 18/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggingIn = false

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Spacer()
                
                Text("Bem-vindo ao VoaVibe")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.azul)
                
                Text("Faça login para planejar suas viagens")
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                Spacer()
                
                TextField("E-mail", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding(.horizontal, 30)
                
                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                    .padding(.horizontal, 30)
                
                Button(action: {
                    loginWithEmail(email: email, password: password)
                }) {
                    Text("Entrar")
                        .textCase(.lowercase)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.laranja)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        .padding(.horizontal, 30)
                }
                
                VStack(spacing: 12) {
                    Button(action: {
                        loginWithGoogle()
                    }) {
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(.white)
                            Text("Entrar com Google")
                                .textCase(.lowercase)
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.azul)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)
                    
                    Button(action: {
                        loginWithApple()
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                                .foregroundColor(.white)
                            Text("Entrar com Apple")
                                .textCase(.lowercase)
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.laranja)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)
                }
                
                Button(action: {
                    loginAsGuest()
                }) {
                    Text("entrar como convidado")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.azul)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        .padding(.horizontal, 30)
                }
                
                Spacer()
                
                NavigationLink(destination: RegisterView()) {
                    Text("Não tem uma conta? Cadastre-se")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 20)
            }
            .background(Color("amareloEnergizante")) 
            .ignoresSafeArea()
        }
    }
    
    // Mock de funções para login
    private func loginWithEmail(email: String, password: String) {
        print("Login com email: \(email), senha: \(password)")
    }

    private func loginWithGoogle() {
        print("Login com Google")
    }

    private func loginWithApple() {
        print("Login com Apple")
    }

    // Função para login como convidado
    private func loginAsGuest() {
        print("Login como convidado")
    }
}

//// Substitua por sua tela de cadastro
//struct RegisterView: View {
//    var body: some View {
//        Text("Tela de Cadastro")
//            .font(.largeTitle)
//            .fontWeight(.bold)
//    }
//}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
