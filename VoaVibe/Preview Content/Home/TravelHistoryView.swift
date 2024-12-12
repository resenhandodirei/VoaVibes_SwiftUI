//
//  TravelHistoryView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct TravelHistoryView: View {
    // Modelo para viagens passadas
    struct Travel: Identifiable {
        let id = UUID()
        let destination: String
        let startDate: String
        let endDate: String
        let summary: String
    }

    // Dados de exemplo
    @State private var travelHistory: [Travel] = [
        Travel(destination: "Paris, França", startDate: "10/01/2024", endDate: "20/01/2024", summary: "Roteiro com visitas à Torre Eiffel, Louvre e bairros históricos."),
        Travel(destination: "Tokyo, Japão", startDate: "15/02/2024", endDate: "25/02/2024", summary: "Exploração da cultura japonesa, templos e culinária."),
        Travel(destination: "Nova York, EUA", startDate: "01/03/2024", endDate: "10/03/2024", summary: "Roteiro urbano com passeios pela Times Square, Central Park e museus.")
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Histórico de Viagens")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.azul)
                
                if travelHistory.isEmpty {
                    Text("Você ainda não possui viagens registradas.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List(travelHistory) { travel in
                        NavigationLink(destination: TravelDetailView(travel: travel)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(travel.destination)
                                    .font(.headline)
                                    .foregroundColor(.amareloEnergizante)
                                Text("\(travel.startDate) - \(travel.endDate)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(travel.summary)
                                    .font(.body)
                                    .lineLimit(2)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
//            .navigationTitle("Histórico de Viagens")
        }
    }
}

struct TravelDetailView: View {
    let travel: TravelHistoryView.Travel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(travel.destination)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 8)
                .foregroundColor(.azul)

            Text("Período: \(travel.startDate) - \(travel.endDate)")
                .font(.headline)
                .foregroundColor(.gray)

            Divider()

            Text("Resumo do Roteiro")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.amareloEnergizante)
            Text(travel.summary)
                .font(.body)

            Spacer()
        }
        .padding()
        .navigationTitle("Detalhes da Viagem")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TravelHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TravelHistoryView()
    }
}
