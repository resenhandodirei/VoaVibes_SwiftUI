//
//  AboutAppView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct AboutAppView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Cabeçalho
                VStack {
                    Text("Sobre o Voavibe")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(.azul)
                    
                    Text("Descubra mais sobre o aplicativo, nossa equipe e nosso compromisso com a sua privacidade.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                
                Divider()
                
                // Informações do App
                VStack(alignment: .leading, spacing: 10) {
                    Text("📱 Versão do App")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    Text("Voavibe 1.0.0")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Divider()
                
                // Informações da Equipe
                VStack(alignment: .leading, spacing: 10) {
                    Text("👩‍💻 Equipe de Desenvolvimento")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    Text("Somos uma equipe apaixonada por ajudar você a explorar o mundo com praticidade e personalização. Nossa missão é transformar o planejamento de viagens em algo fácil e prazeroso.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Divider()
                
                // Política de Privacidade
                VStack(alignment: .leading, spacing: 10) {
                    Text("🔒 Política de Privacidade")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    Text("A sua privacidade é nossa prioridade. Garantimos que os seus dados estão protegidos e são utilizados apenas para oferecer a melhor experiência de viagem possível.")
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Button(action: {
                        openPrivacyPolicy()
                    }) {
                        Text("Leia nossa Política de Privacidade")
                            .font(.body)
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color("amareloEnergizante")) // Aplique sua cor personalizada
                            .foregroundColor(.white)
                            .cornerRadius(10) // Arredonda as bordas
                            .frame(maxWidth: .infinity) // Faz o botão ocupar toda a largura disponível
                            .shadow(radius: 5) // Adiciona uma sombra suave
                    }
                    .padding(.top, 10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
    }
    
    // Ação para abrir a política de privacidade
    private func openPrivacyPolicy() {
        print("Abrir a política de privacidade")
        // Implementar lógica para abrir link ou tela da política de privacidade
    }
}

// Preview
struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppView()
    }
}
