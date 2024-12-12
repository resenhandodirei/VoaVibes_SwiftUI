//
//  DestinationReviewView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct DestinationReviewView: View {
    // Modelo para avaliação
    struct Review: Identifiable {
        let id = UUID()
        let destination: String
        let rating: Int
        let comment: String
    }

    // Estados para gerenciamento das avaliações
    @State private var reviews: [Review] = []
    @State private var destination: String = ""
    @State private var rating: Int = 0
    @State private var comment: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Avaliações de Destinos")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.azul)
                
                Form {
                    Section(header: Text("Avalie um Destino").foregroundColor(.amareloEnergizante)) {
                        TextField("Destino visitado", text: $destination)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        HStack {
                            Text("Avaliação:")
                                .foregroundColor(.amareloEnergizante)
                            Spacer()
                            ForEach(1...5, id: \.self) { star in
                                Image(systemName: star <= rating ? "star.fill" : "star")
                                    .foregroundColor(star <= rating ? .yellow : .gray)
                                    .onTapGesture {
                                        rating = star
                                    }
                            }
                        }
                        .padding(.vertical, 8)
                        
                        TextEditor(text: $comment)
                            .frame(height: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                            .padding(.vertical, 8)
                    }
                    
                    Button(action: addReview) {
                        Text("Salvar Avaliação")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .foregroundColor(.white)
                            .background(destination.isEmpty || rating == 0 ? Color.azul : Color.amareloEnergizante)
                            .cornerRadius(8)
                    }
                    .disabled(destination.isEmpty || rating == 0)
                }
                .listStyle(InsetGroupedListStyle())
                
                if reviews.isEmpty {
                    Text("Nenhuma avaliação registrada ainda.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(reviews) { review in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(review.destination)
                                .font(.headline)
                            HStack {
                                ForEach(1...5, id: \.self) { star in
                                    Image(systemName: star <= review.rating ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                }
                            }
                            .padding(.vertical, 4)
                            Text(review.comment)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 8)
                    }
                    .listStyle(PlainListStyle())
                }
            }
//            .navigationTitle("Avaliações de Destinos")
        }
    }
    
    // Função para adicionar uma nova avaliação
    private func addReview() {
        let newReview = Review(destination: destination, rating: rating, comment: comment)
        reviews.append(newReview)
        clearForm()
    }
    
    // Função para limpar os campos após salvar a avaliação
    private func clearForm() {
        destination = ""
        rating = 0
        comment = ""
    }
}

struct DestinationReviewView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationReviewView()
    }
}
