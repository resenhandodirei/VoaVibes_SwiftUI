//
//  PlanItineraryView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 19/11/24.
//

import SwiftUI

struct PlanItineraryView: View {
    @State private var destination: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var activities: [String] = []
    @State private var newActivity: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()

                    // Título do Roteiro
                    Text("Planejar Roteiro")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.azul)
                        .padding(.top, 20)
                    
                    // Campo para escolher o destino
                    VStack(alignment: .leading) {
                        Text("Destino")
                            .font(.headline)
                            .foregroundColor(.azul)
                        TextField("Digite o destino", text: $destination)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top, 5)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.azul, lineWidth: 2))
                    }

                    // Escolha de datas
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Datas")
                            .font(.headline)
                            .foregroundColor(.azul)
                        HStack {
                            VStack {
                                Text("Início")
                                    .font(.subheadline)
                                    .foregroundColor(.azul)
                                DatePicker("", selection: $startDate, displayedComponents: .date)
                                    .labelsHidden()
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.azul, lineWidth: 1))
                            }
                            Spacer()
                            VStack {
                                Text("Fim")
                                    .font(.subheadline)
                                    .foregroundColor(.azul)
                                DatePicker("", selection: $endDate, displayedComponents: .date)
                                    .labelsHidden()
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.azul, lineWidth: 1))
                            }
                        }
                    }

                    // Adicionar atividades
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Atividades Planejadas")
                            .font(.headline)
                            .foregroundColor(.azul)
                        HStack {
                            TextField("Ex: Visitar museu", text: $newActivity)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.top, 5)
                            Button(action: addActivity) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.azul)
                                    .font(.title2)
                            }
                        }

                        // Lista de atividades
                        if !activities.isEmpty {
                            ForEach(activities, id: \.self) { activity in
                                HStack {
                                    Text(activity)
                                        .font(.body)
                                        .foregroundColor(.azul)
                                    Spacer()
                                    Button(action: { removeActivity(activity) }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                }
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                                .background(Color.azul.opacity(0.1))
                                .cornerRadius(10)
                            }
                        }
                    }

                    // Botão para salvar o roteiro
                    Button(action: saveItinerary) {
                        Text("Salvar Roteiro")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.azul)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
            .background(Color("amareloEnergizante").opacity(0.30)) // Fundo amarelo energizante com leve transparência
            .ignoresSafeArea()
        }
    }

    // Função para adicionar uma nova atividade
    private func addActivity() {
        guard !newActivity.isEmpty else { return }
        activities.append(newActivity)
        newActivity = ""
    }

    // Função para remover uma atividade
    private func removeActivity(_ activity: String) {
        activities.removeAll { $0 == activity }
    }

    // Função para salvar o roteiro
    private func saveItinerary() {
        // Aqui você pode integrar o salvamento com Core Data ou enviar os dados para um backend
        print("Roteiro salvo com destino: \(destination), início: \(startDate), fim: \(endDate), atividades: \(activities)")
    }
}

struct PlanItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        PlanItineraryView()
    }
}

