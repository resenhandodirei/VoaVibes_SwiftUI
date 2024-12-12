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
            
            Text("Crie sua conta no VoaVibe")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color("azul"))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.horizontal, 30)
                .minimumScaleFactor(0.5)
            
            VStack(spacing: 15) {
                TextField("Nome", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.words)
                    .padding(.horizontal, 30)
                
                TextField("E-mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal, 30)
                
                SecureField("Senha", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)
                
                SecureField("Confirmar Senha", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Preferência de viagem:")
                        .font(.headline)
                        .foregroundColor(Color(.white))
                        .padding(.horizontal, 30)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(preferences, id: \.self) { preference in
                                Button(action: {
                                    selectedPreference = preference
                                }) {
                                    Text(preference)
                                        .fontWeight(.medium)
                                        .foregroundColor(selectedPreference == preference ? .white : Color("azul"))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 12)
                                        .frame(minWidth: 140, maxWidth: .infinity, minHeight: 50)
                                        .background(selectedPreference == preference ? Color("laranja") : Color.white)
                                        .cornerRadius(25)
                                        .shadow(color: selectedPreference == preference ? Color("azul").opacity(0.5) : Color.clear, radius: 10, x: 0, y: 5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color("azul"), lineWidth: selectedPreference == preference ? 0 : 2)
                                        )
                                        .scaleEffect(selectedPreference == preference ? 1.05 : 1)
                                        .animation(.spring(), value: selectedPreference)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                }
            }
            
            Button(action: handleRegistration) {
                Text("Cadastrar")
                    .textCase(.lowercase)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("azul"))
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    .shadow(radius: 5)
            }
            
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("amareloEnergizante")]),
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

