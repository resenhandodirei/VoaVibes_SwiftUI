//
//  SupportAndHelpView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct SupportAndHelpView: View {
    // Dados para FAQ
    struct FAQItem: Identifiable {
        let id = UUID()
        let question: String
        let answer: String
    }
    
    @State private var faqItems: [FAQItem] = [
        FAQItem(question: "Como criar um roteiro?", answer: "Vá para a tela de Planejamento de Roteiro, escolha um destino e datas, e adicione as atividades desejadas."),
        FAQItem(question: "Como acompanho meus gastos?", answer: "Use a tela de Acompanhamento de Gastos para adicionar e visualizar despesas por categoria."),
        FAQItem(question: "Como marcar favoritos?", answer: "Ao visualizar um destino ou roteiro, clique no ícone de coração para marcá-lo como favorito.")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Suporte e Ajuda")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.azul)
                    
                    Text("Encontre respostas para suas dúvidas e suporte.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                List {
                    Section(header: Text("Perguntas Frequentes")) {
                        ForEach(faqItems) { item in
                            DisclosureGroup(item.question) {
                                Text(item.answer)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .padding(.vertical, 4)
                            }
                        }
                    }
                    
                    Section(header: Text("Tutoriais")) {
                        NavigationLink(destination: TutorialView()) {
                            HStack {
                                Image(systemName: "book")
                                    .foregroundColor(.amareloEnergizante)
                                Text("Veja nossos tutoriais")
                                    .font(.body)
                            }
                        }
                    }
                    
                    Section(header: Text("Chat de Suporte")) {
                        Button(action: openChat) {
                            HStack {
                                Image(systemName: "message")
                                    .foregroundColor(.amareloEnergizante)
                                Text("Fale com nosso suporte")
                                    .font(.body)
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
//            .navigationTitle("Ajuda")
        }
    }
    
    // Função para abrir o chat de suporte (placeholder)
    private func openChat() {
        print("Abrir chat de suporte")
        // Aqui você pode implementar a lógica para abrir uma interface de chat
    }
}

struct TutorialView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Tutoriais")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 16)
                
                Text("1. Como criar um roteiro de viagem?")
                    .font(.headline)
                Text("Siga os passos para planejar seu roteiro diretamente na tela de Planejamento de Roteiro.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("2. Como adicionar gastos?")
                    .font(.headline)
                Text("Vá para a tela de Acompanhamento de Gastos, clique em 'Adicionar Gasto', e preencha as informações.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("3. Como marcar destinos favoritos?")
                    .font(.headline)
                Text("Clique no ícone de coração ao visualizar um destino ou roteiro.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle("Tutoriais")
    }
}

struct SupportAndHelpView_Previews: PreviewProvider {
    static var previews: some View {
        SupportAndHelpView()
    }
}
