//
//  TestResultsView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 19/11/24.
//

import SwiftUI

struct TestResultsView: View {
    // Variáveis para o perfil do usuário e sugestões
    var userProfile: String
    var suggestedDestinations: [String]

    var body: some View {
        VStack(spacing: 20) {
            // Título da tela
            Text("Resultado do Teste")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 64)
                .foregroundColor(.azul)
            
            // Perfil do usuário
            Text(userProfile)
                .font(.title2)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Divisor decorativo
            Divider()
                .padding(.horizontal)
            
            // Sugestões de destinos
            Text("Sugestões de Destinos para Você")
                .font(.headline)
                .padding(.top)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(suggestedDestinations, id: \.self) { destination in
                        HStack {
                            Image(systemName: "airplane")
                                .foregroundColor(.laranja)
                                .font(.title)
                            
                            Text(destination)
                                .font(.title3)
                                .fontWeight(.medium)
                                .padding(.leading, 5)
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color("azulVibrante").opacity(0.25))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    }
                }
            }
            
            Spacer()
            
            // Botão para explorar mais
            Button(action: {
                print("Explorar mais destinos!")
            }) {
                Text("Explorar Mais")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.azul)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("begeAmarelado")]),
                                   startPoint: .top,
                                   endPoint: .bottom))
        .ignoresSafeArea()
    }
}

struct TestResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultsView(
            userProfile: "Você é uma pessoa que adora relaxar e busca destinos tranquilos para descansar e renovar as energias.",
            suggestedDestinations: ["Maldivas", "Bali", "Ilhas Gregas", "Toscana", "Costa Amalfitana"]
        )
    }
}
