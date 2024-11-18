//
//  RegisterView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 18/11/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var selectedPreference: String = "Aventura"
    @State private var showAlert = false
    @State private var alertMessage = ""

    let preferences = ["Aventura", "Cultura", "Relaxamento", "Gastronomia"]

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Título
            Text("Crie sua conta no VoaVibe")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            // Formulário
            VStack(spacing: 15) {
                // Campo de Nome
                TextField("Nome", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.words)
                    .padding(.horizontal, 30)
                
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
                
                // Campo de Confirmar Senha
                SecureField("Confirmar Senha", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)
                
                // Preferências Iniciais
                VStack(alignment: .leading, spacing: 5) {
                    Text("Preferência de viagem:")
                        .font(.headline)
                        .padding(.horizontal, 30)
                    Picker("Preferência de viagem", selection: $selectedPreference) {
                        ForEach(preferences, id: \.self) { preference in
                            Text(preference)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal, 30)
                }
            }
            
            // Botão de Cadastro
            Button(action: handleRegistration) {
                Text("Cadastrar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    .shadow(radius: 5)
            }
            
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("Beige"), Color("LightBlue")]),
                                   startPoint: .top,
                                   endPoint: .bottom))
        .ignoresSafeArea()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Cadastro"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    // Função para processar o cadastro
    private func handleRegistration() {
        guard !name.isEmpty else {
            alertMessage = "Por favor, insira seu nome."
            showAlert = true
            return
        }
        
        guard email.contains("@") else {
            alertMessage = "Por favor, insira um e-mail válido."
            showAlert = true
            return
        }
        
        guard password.count >= 6 else {
            alertMessage = "A senha deve ter pelo menos 6 caracteres."
            showAlert = true
            return
        }
        
        guard password == confirmPassword else {
            alertMessage = "As senhas não coincidem."
            showAlert = true
            return
        }
        
        alertMessage = "Cadastro realizado com sucesso! Bem-vindo ao VoaVibe."
        showAlert = true
        
        // Aqui você pode integrar com sua lógica de backend para processar o cadastro.
        print("Usuário cadastrado:")
        print("Nome: \(name), E-mail: \(email), Preferência: \(selectedPreference)")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
