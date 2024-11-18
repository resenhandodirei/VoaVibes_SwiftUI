//
//  WelcomeView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 18/11/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Defina o fundo de toda a tela com a cor bege amarelado
                Color(red: 0.98, green: 0.92, blue: 0.74) // Tom de bege amarelado
                    .edgesIgnoringSafeArea(.all) // Faz com que a cor ocupe toda a tela, incluindo a área segura

                VStack(spacing: 40) {
                    // Logo ou imagem do app
                    Image(systemName: "airplane.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(Color("azulVibrante").opacity(30.0))  // Aumentando a opacidade do azul
                    
                    // Slogan
                    Text("Explore o mundo com o VoaVibe")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("azulVibrante").opacity(0.9))  // Aumentando a opacidade do azul
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    // Botão "Começar"
                    NavigationLink(destination: NextView()) { // Substitua `NextView` pela próxima tela
                        Text("Começar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("azulVibrante").opacity(0.9))  // Aumentando a opacidade do azul
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)
                }
                .padding()
            }
        }
    }
}

// Substitua `NextView` pela próxima tela
struct NextView: View {
    var body: some View {
        Text("Próxima tela aqui!")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
