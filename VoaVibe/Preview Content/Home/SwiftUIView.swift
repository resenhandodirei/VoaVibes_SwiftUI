//
//  SwiftUIView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct FavoritesView: View {
    // Modelo para os favoritos
    struct FavoriteItem: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let imageName: String
        let type: String // "Destino" ou "Roteiro"
    }
    
    // Dados simulados de favoritos
    @State private var favoriteItems: [FavoriteItem] = [
        FavoriteItem(name: "Paris", description: "Cidade da Luz, cheia de cultura e charme.", imageName: "eiffel_tower", type: "Destino"),
        FavoriteItem(name: "Roteiro de Aventura", description: "Exploração de trilhas e montanhas.", imageName: "mountain", type: "Roteiro"),
        FavoriteItem(name: "Tóquio", description: "Mistura perfeita de tradição e modernidade.", imageName: "tokyo_tower", type: "Destino"),
        FavoriteItem(name: "Roteiro de Praias", description: "Relaxamento em praias paradisíacas.", imageName: "beach", type: "Roteiro")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Cabeçalho
                VStack(alignment: .leading, spacing: 8) {
                    Text("Favoritos")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Veja seus destinos e roteiros favoritos.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                // Lista de Favoritos
                List {
                    ForEach(favoriteItems) { item in
                        FavoriteRow(item: item)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Favoritos")
            .toolbar {
                EditButton() // Permite editar a lista (remover favoritos)
            }
        }
    }
    
    // Função para excluir itens
    private func deleteItems(at offsets: IndexSet) {
        favoriteItems.remove(atOffsets: offsets)
    }
}

// Componente para cada item de favorito
struct FavoriteRow: View {
    let item: FavoritesView.FavoriteItem
    
    var body: some View {
        HStack {
            // Imagem do favorito
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 2)
            
            VStack(alignment: .leading, spacing: 4) {
                // Nome e descrição
                Text(item.name)
                    .font(.headline)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            // Tag de tipo (Destino ou Roteiro)
            Text(item.type)
                .font(.caption)
                .foregroundColor(.white)
                .padding(6)
                .background(item.type == "Destino" ? Color.blue : Color.green)
                .clipShape(Capsule())
        }
        .padding(.vertical, 8)
    }
}

// Preview
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
