//
//  ItineraryDetailView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

//
//  ItineraryDetailView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    var name: String
    var time: String
    var location: String
}

struct ItineraryDetailView: View {
    var destination: String
    var startDate: Date
    var endDate: Date
    var activities: [Activity]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(destination)
                    .font(.largeTitle)
                    .foregroundColor(.azul)
                    .fontWeight(.bold)
                    .padding(.bottom, 4)
                    .padding(.horizontal, 16)

                Text("De \(formattedDate(startDate)) até \(formattedDate(endDate))")
                    .font(.headline)
                    .foregroundColor(.azul)                    .padding(.horizontal, 16)


                Divider()

                Text("Atividades")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 4)
                    .padding(.horizontal, 16)
                    .foregroundColor(.amareloEnergizante)

                ForEach(activities) { activity in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.name)
                            .font(.headline)

                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.azul)
                            Text(activity.time)
                                .foregroundColor(.secondary)
                        }

                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.amareloEnergizante)
                            Text(activity.location)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.30))
                    .cornerRadius(8)
                    .padding(.horizontal, 16) 
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Detalhes do Roteiro")
    }

    // Formatação de data
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct ItineraryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryDetailView(
            destination: "Paris",
            startDate: Date(),
            endDate: Date().addingTimeInterval(86400 * 5),
            activities: [
                Activity(name: "Torre Eiffel", time: "10:00 AM", location: "Champ de Mars, 5 Avenue Anatole France"),
                Activity(name: "Museu do Louvre", time: "2:00 PM", location: "Rue de Rivoli"),
                Activity(name: "Passeio pelo Sena", time: "5:30 PM", location: "Bateaux Parisiens, Port de la Bourdonnais")
            ]
        )
    }
}
