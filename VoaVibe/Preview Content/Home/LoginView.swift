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
            VStack(spacing: 20) {
                Spacer()
                
                // Título
                Text("Bem-vindo ao VoaVibe")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                // Subtítulo
                Text("Faça login para planejar suas viagens")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                // Campo de E-mail
                TextField("E-mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal, 30)
                
                // Campo de Senha
                SecureField("Senha", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)
                
                // Botão de Login
                Button(action: {
                    // Função para login com email/senha
                    loginWithEmail(email: email, password: password)
                }) {
                    Text("Entrar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                        .shadow(radius: 5)
                }
                
                // Botões de Login Social
                VStack(spacing: 15) {
                    Button(action: {
                        // Função para login com Google
                        loginWithGoogle()
                    }) {
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(.white)
                            Text("Entrar com Google")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)
                    
                    Button(action: {
                        // Função para login com Apple
                        loginWithApple()
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                                .foregroundColor(.white)
                            Text("Entrar com Apple")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)
                }
                
                Spacer()
                
                // Link para Registro
                NavigationLink(destination: RegisterView()) {
                    Text("Não tem uma conta? Cadastre-se")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 20)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color("Beige"), Color("LightBlue")]),
                                       startPoint: .top,
                                       endPoint: .bottom))
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
}

// Substitua por sua tela de cadastro
struct RegisterView: View {
    var body: some View {
        Text("Tela de Cadastro")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
