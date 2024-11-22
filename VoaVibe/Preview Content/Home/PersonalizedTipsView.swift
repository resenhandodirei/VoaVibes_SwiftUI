//
//  PersonalizedTipsView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct PersonalizedTipsView: View {
    // Modelo para dicas
    struct Tip: Identifiable {
        let id = UUID()
        let title: String
        let description: String
        let category: String
    }
    
    // Dados simulados de dicas personalizadas
    let tips: [Tip] = [
        Tip(title: "Descubra Cafés Locais", description: "Explore os melhores cafés da cidade para relaxar enquanto planeja sua próxima aventura.", category: "Gastronomia"),
        Tip(title: "Parques Imperdíveis", description: "Passeios ao ar livre em parques recomendados para momentos de paz e conexão com a natureza.", category: "Natureza"),
        Tip(title: "Dicas de Mochilão", description: "Tudo o que você precisa saber para uma viagem prática e econômica.", category: "Viagem Econômica"),
        Tip(title: "Museus e Cultura", description: "Os museus mais visitados para expandir seus horizontes culturais.", category: "Cultura"),
        Tip(title: "Melhores Destinos Tropicais", description: "Lugares incríveis com praias paradisíacas para você conhecer.", category: "Praias")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Header com mensagem personalizada
                VStack(alignment: .leading, spacing: 8) {
                    Text("Dicas Personalizadas")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.azul)
                    
                    Text("Explore sugestões exclusivas baseadas no seu perfil!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                // Lista de dicas
                List(tips) { tip in
                    NavigationLink(destination: TipDetailView(tip: tip)) {
                        HStack {
                            // Ícone por categoria
                            Image(systemName: iconForCategory(tip.category))
                                .foregroundColor(colorForCategory(tip.category))
                                .frame(width: 40, height: 40)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(tip.title)
                                    .font(.headline)
                                    .foregroundColor(.amareloEnergizante)
                                Text(tip.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
//            .navigationTitle("Dicas")
        }
    }
    
    // Função para definir ícone por categoria
    private func iconForCategory(_ category: String) -> String {
        switch category {
        case "Gastronomia": return "cup.and.saucer.fill"
        case "Natureza": return "leaf.fill"
        case "Viagem Econômica": return "backpack.fill"
        case "Cultura": return "paintpalette.fill"
        case "Praias": return "sun.max.fill"
        default: return "sparkles"
        }
    }
    
    // Função para definir cor por categoria
    private func colorForCategory(_ category: String) -> Color {
        switch category {
        case "Gastronomia": return .brown
        case "Natureza": return .green
        case "Viagem Econômica": return .orange
        case "Cultura": return .purple
        case "Praias": return .blue
        default: return .gray
        }
    }
}

// Tela de Detalhes da Dica
struct TipDetailView: View {
    let tip: PersonalizedTipsView.Tip
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Título da dica
                Text(tip.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.azul)

                
                // Categoria e descrição detalhada
                Text("Categoria: \(tip.category)")
                    .font(.subheadline)
                    .foregroundColor(.amareloEnergizante)
                
                Text(tip.description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        .navigationTitle(tip.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonalizedTipsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalizedTipsView()
    }
}
