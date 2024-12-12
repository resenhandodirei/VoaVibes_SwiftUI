//
//  ItineraryListView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 19/11/24.
//

import SwiftUI

struct Itinerary: Identifiable {
    let id = UUID()
    var destination: String
    var startDate: Date
    var endDate: Date
    var activities: [String]
}

struct ItineraryListView: View {
    @State private var itineraries: [Itinerary] = [
        Itinerary(destination: "Paris", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 5), activities: ["Torre Eiffel", "Louvre"]),
        Itinerary(destination: "Tokyo", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 7), activities: ["Templo Sensoji", "Mercado Tsukiji"])
    ]

    @State private var showEditView = false
    @State private var selectedItinerary: Itinerary?

    var body: some View {
        NavigationView {
            VStack {
                Text("Meus Roteiros")
                    .font(.title)
                    .foregroundColor(.azul) 
                    .fontWeight(.semibold)

                List {
                    ForEach(itineraries) { itinerary in
                        VStack(alignment: .leading) {
                            Text(itinerary.destination)
                                .font(.headline)
                                .foregroundColor(.amareloEnergizante)
                            Text("De \(formattedDate(itinerary.startDate)) até \(formattedDate(itinerary.endDate))")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Atividades: \(itinerary.activities.joined(separator: ", "))")
                                .font(.footnote)
                                .foregroundColor(.secondary)
    
                        }
                        .padding(.vertical, 16)
                        .contextMenu {
                            Button("Editar") {
                                editItinerary(itinerary)
                            }
                            Button("Excluir", role: .destructive) {
                                deleteItinerary(itinerary)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: createNewItinerary) {
                            Image(systemName: "plus")
                                .foregroundColor(.amareloEnergizante)
                        }
                    }
                }
            }
        }
        .sheet(item: $selectedItinerary, content: { itinerary in
            EditItineraryView(itinerary: itinerary, saveAction: updateItinerary)
        })
    }

    // Formatação de data
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    // Editar um roteiro
    private func editItinerary(_ itinerary: Itinerary) {
        selectedItinerary = itinerary
    }

    // Atualizar um roteiro editado
    private func updateItinerary(_ updatedItinerary: Itinerary) {
        if let index = itineraries.firstIndex(where: { $0.id == updatedItinerary.id }) {
            itineraries[index] = updatedItinerary
        }
    }

    // Excluir um roteiro
    private func deleteItinerary(_ itinerary: Itinerary) {
        itineraries.removeAll { $0.id == itinerary.id }
    }

    // Criar um novo roteiro
    private func createNewItinerary() {
        let newItinerary = Itinerary(destination: "Novo Destino", startDate: Date(), endDate: Date().addingTimeInterval(86400), activities: [])
        itineraries.append(newItinerary)
    }
}

struct EditItineraryView: View {
    @State var itinerary: Itinerary
    var saveAction: (Itinerary) -> Void

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Section(header: Text("Destino")) {
                TextField("Digite o destino", text: $itinerary.destination)
            }
            Section(header: Text("Datas")) {
                DatePicker("Data de início", selection: $itinerary.startDate, displayedComponents: .date)
                DatePicker("Data de fim", selection: $itinerary.endDate, displayedComponents: .date)
            }
            Section(header: Text("Atividades")) {
                ForEach(itinerary.activities, id: \.self) { activity in
                    Text(activity)
                }
            }
        }
        .navigationTitle("Editar Roteiro")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Salvar") {
                    saveAction(itinerary)
                    dismiss()
                }
            }
        }
    }
}

struct ItineraryListView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryListView()
    }
}
