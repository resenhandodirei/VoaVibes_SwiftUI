//
//  TravelChecklistView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct TravelChecklistView: View {
    struct ChecklistItem: Identifiable {
        let id = UUID()
        var name: String
        var isChecked: Bool
    }

    @State private var checklistItems: [ChecklistItem] = [
        ChecklistItem(name: "Passaporte", isChecked: false),
        ChecklistItem(name: "Roupas", isChecked: false),
        ChecklistItem(name: "Carregador de Celular", isChecked: true),
        ChecklistItem(name: "Itens de Higiene Pessoal", isChecked: false)
    ]
    
    @State private var newItemName: String = ""
    @FocusState private var isInputFocused: Bool

    var body: some View {
        NavigationView {
            VStack {
                Text("Checklist de Viagem")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.azul)
                
                HStack {
                    TextField("Adicionar novo item", text: $newItemName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .focused($isInputFocused)
                        .padding(.horizontal)
                    
                    Button(action: addNewItem) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.amareloEnergizante)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }
                    .disabled(newItemName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(.vertical)

                List {
                    ForEach($checklistItems) { $item in
                        HStack {
                            Button(action: {
                                item.isChecked.toggle()
                            }) {
                                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isChecked ? .azul : .gray)
                                    .font(.title2)
                            }

                            Text(item.name)
                                .strikethrough(item.isChecked, color: .green)
                                .foregroundColor(item.isChecked ? .gray : .primary)
                                .padding(.leading, 8)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                deleteItem(item)
                            } label: {
                                Label("Excluir", systemImage: "trash")
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
//            .navigationTitle("Checklist de Viagem")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Adiciona um novo item ao checklist
    private func addNewItem() {
        guard !newItemName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let newItem = ChecklistItem(name: newItemName, isChecked: false)
        checklistItems.append(newItem)
        newItemName = ""
        isInputFocused = false
    }

    // Exclui um item do checklist
    private func deleteItem(_ item: ChecklistItem) {
        checklistItems.removeAll { $0.id == item.id }
    }
}

struct TravelChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        TravelChecklistView()
    }
}
