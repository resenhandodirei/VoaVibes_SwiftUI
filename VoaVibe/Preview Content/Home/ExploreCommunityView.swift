//
//  ExploreCommunityView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct ExploreCommunityView: View {
    struct Post: Identifiable {
        let id = UUID()
        let username: String
        let avatar: String
        let content: String
        let date: String
        var likes: Int
        var comments: Int
        var isLiked: Bool
    }
    
    @State private var posts: [Post] = [
        Post(username: "AnaViajante",
             avatar: "person.fill",
             content: "Acabei de voltar de Paris e recomendo visitar o Museu do Louvre à noite! Menos filas e uma experiência mágica.",
             date: "2 dias atrás",
             likes: 54,
             comments: 12,
             isLiked: false),
        Post(username: "MundoPeloMundo",
             avatar: "person.circle.fill",
             content: "Para quem vai ao Japão: não percam o festival de cerejeiras em Kyoto. É espetacular!",
             date: "3 dias atrás",
             likes: 72,
             comments: 25,
             isLiked: false),
        Post(username: "VivaAventura",
             avatar: "person.crop.circle",
             content: "Dica rápida: use roupas leves e confortáveis para trilhas no Peru. Leve sempre água e protetor solar!",
             date: "5 dias atrás",
             likes: 35,
             comments: 7,
             isLiked: false)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Comunidade")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.azul)
                
                List {
                    ForEach(posts) { post in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: post.avatar)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .foregroundColor(Color("amareloEnergizante"))
                                
                                VStack(alignment: .leading) {
                                    Text(post.username)
                                        .font(.headline)
                                    Text(post.date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Text(post.content)
                                .font(.body)
                                .foregroundColor(.primary)
                            
                            HStack {
                                Button(action: {
                                    likePost(post)
                                }) {
                                    Label("\(post.likes)", systemImage: "hand.thumbsup")
                                        .foregroundColor(post.isLiked ? Color("amareloEnergizante") : .secondary)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                
                                Button(action: {
                                    commentOnPost(post)
                                }) {
                                    Label("\(post.comments)", systemImage: "message")
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                
                                Spacer()
                            }
                            .foregroundColor(.secondary)
                            .padding(.top, 4)
                        }
                        .padding(.vertical, 12)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
                    }
                }
                .listStyle(InsetGroupedListStyle())
    //            .navigationTitle("Comunidade")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: addNewPost) {
                            Label("Novo Post", systemImage: "plus")
                                .foregroundColor(Color("amareloEnergizante")) 
                        }
                    }
                }
            }
        }
    }
    
    // Função para curtir um post
    private func likePost(_ post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].isLiked.toggle() // Alterar estado de curtir
            posts[index].likes += posts[index].isLiked ? 1 : -1 // Atualizar contagem de curtidas
        }
    }
    
    // Função para comentar em um post
    private func commentOnPost(_ post: Post) {
        print("Abrir interface de comentários para: \(post.username)")
        // Implementar a lógica para abrir uma interface de comentários
    }
    
    // Função para adicionar um novo post
    private func addNewPost() {
        print("Abrir interface para criar novo post")
        // Implementar a lógica para adicionar novos posts
    }
}

// Preview
struct ExploreCommunityView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCommunityView()
    }
}
