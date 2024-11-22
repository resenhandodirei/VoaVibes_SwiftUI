//
//  ExpenseTrackingView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

// Modelo para a despesa
struct Expense: Identifiable {
    let id = UUID()
    var category: String
    var amount: Double
    var date: Date
}

struct ExpenseTrackingView: View {
    @State private var expenses: [Expense] = []
    @State private var newCategory: String = ""
    @State private var newAmount: String = ""
    @State private var selectedDate: Date = Date()
    @State private var showingAddExpense = false
    
    // Função para adicionar uma despesa
    func addExpense() {
        if let amount = Double(newAmount), !newCategory.isEmpty {
            let expense = Expense(category: newCategory, amount: amount, date: selectedDate)
            expenses.append(expense)
            newCategory = ""
            newAmount = ""
            selectedDate = Date()
        }
    }
    
    // Função para editar uma despesa
    func editExpense(expense: Expense) {
        if let index = expenses.firstIndex(where: { $0.id == expense.id }) {
            expenses[index] = expense
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                 Text("Acompanhamento de gastos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.azul)
                List {
                    ForEach(expenses) { expense in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(expense.category)
                                    .font(.headline)
                                Text("\(expense.amount, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("\(expense.date, style: .date)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action: {
                                showingAddExpense.toggle()
                            }) {
                                Image(systemName: "pencil.circle.fill")
                                    .foregroundColor(.blue)
                            }
                            .sheet(isPresented: $showingAddExpense) {
                                AddExpenseView(expense: expense, onSave: { updatedExpense in
                                    editExpense(expense: updatedExpense)
                                    showingAddExpense = false
                                })
                            }
                        }
                    }
                    .onDelete(perform: deleteExpense)
                }
                
                // Botão para adicionar nova despesa
                Button(action: {
                    showingAddExpense.toggle()
                }) {
                    Text("Adicionar Despesa")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.amareloEnergizante)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
//            .navigationBarTitle("Acompanhamento de Gastos")
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView(expense: Expense(category: "", amount: 0, date: Date()), onSave: { newExpense in
                    expenses.append(newExpense)
                    showingAddExpense = false
                })
            }
        }
    }
    
    // Função para excluir uma despesa
    func deleteExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
}

struct AddExpenseView: View {
    @State var expense: Expense
    @State private var newCategory: String
    @State private var newAmount: String
    @State private var selectedDate: Date
    var onSave: (Expense) -> Void
    
    init(expense: Expense, onSave: @escaping (Expense) -> Void) {
        self.expense = expense
        self.onSave = onSave
        _newCategory = State(initialValue: expense.category)
        _newAmount = State(initialValue: "\(expense.amount)")
        _selectedDate = State(initialValue: expense.date)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Adicionar/Editar despesa")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.azul)
                Form {
                    Section(header: Text("Detalhes da Despesa")) {
                        TextField("Categoria", text: $newCategory)
                        TextField("Valor", text: $newAmount)
                            .keyboardType(.decimalPad)
                        DatePicker("Data", selection: $selectedDate, displayedComponents: .date)
                    }
                    
                    Section {
                        Button(action: {
                            if let amount = Double(newAmount), !newCategory.isEmpty {
                                let updatedExpense = Expense(category: newCategory, amount: amount, date: selectedDate)
                                onSave(updatedExpense)
                            }
                        }) {
                            Text("Salvar")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.amareloEnergizante)
                                .cornerRadius(10)
                        }
                    }
                }
            }
//            .navigationBarTitle("Adicionar/Editar Despesa")
        }
    }
}

struct ExpenseTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackingView()
    }
}
