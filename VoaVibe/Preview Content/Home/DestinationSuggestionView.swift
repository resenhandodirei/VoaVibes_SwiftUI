//
//  DestinationSuggestionView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//
import SwiftUI

struct DestinationSuggestionView: View {
    struct Destination: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let imageName: String
    }

    @State private var destinations: [Destination] = [
        Destination(name: "Torre Eiffel", description: "Uma das maravilhas do mundo, localizada em Paris.", imageName: "eiffel"),
        Destination(name: "Praia de Copacabana", description: "Uma das praias mais icônicas do Brasil, no Rio de Janeiro.", imageName: "copacabana"),
        Destination(name: "Monte Fuji", description: "A montanha mais famosa do Japão, um símbolo de paz e beleza.", imageName: "fuji"),
        Destination(name: "Coliseu", description: "Uma joia da história romana, em Roma, Itália.", imageName: "coliseum")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sugestões de Destinos")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.azul)
                
                List(destinations) { destination in
                    NavigationLink(destination: DestinationDetailView(destination: destination)) {
                        HStack {
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 2)
                            
                            VStack(alignment: .leading) {
                                Text(destination.name)
                                    .font(.headline)
                                    .foregroundColor(.amareloEnergizante)
                                
                                
                                Text(destination.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("amareloEnergizante"))
                                .font(.title2)
                        }
                        .padding(.vertical, 10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
                    }
                }
                .listStyle(PlainListStyle()) 
            }
        }
    }
}

struct DestinationDetailView: View {
    let destination: DestinationSuggestionView.Destination

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(destination.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                
                Text(destination.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)
                
                Text(destination.description)
                    .font(.body)
                    .padding(.top, 5)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DestinationSuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSuggestionView()
    }
}

