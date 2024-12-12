//
//  HomeDashboardView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 19/11/24.
//

import SwiftUI

struct HomeDashboardView: View {
    @State private var recentExpenses: [String] = ["Hospedagem: $200", "Alimentação: $75", "Transporte: $50"]
    @State private var suggestedTrips: [String] = ["Toscana", "Kyoto", "Bali"]
    @State private var notifications: [String] = ["Você tem um novo alerta de viagem!", "Lembre-se de verificar seus gastos mensais."]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
                    Text("Bem-vindo(a) ao VoaVibe")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .foregroundColor(.azul)

                    // Notificações
                    VStack(alignment: .leading) {
                        Text("Notificações")
                            .font(.headline)
                            .padding(.top)
                        ForEach(notifications, id: \.self) { notification in
                            HStack {
                                Image(systemName: "bell.fill")
                                    .foregroundColor(.amareloEnergizante)
                                Text(notification)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                Spacer()
                            }
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .background(Color.amareloEnergizante.opacity(0.25))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)

                    // Atalhos principais
                    HStack(spacing: 15) {
                        NavigationLink(destination: CreateItineraryView()) {
                            DashboardShortcutView(icon: "map", title: "Criar Roteiro", color: Color.blue)
                        }
                        NavigationLink(destination: ExpensesView()) {
                            DashboardShortcutView(icon: "dollarsign.circle", title: "Gastos Recentes", color: Color.green)
                        }
                        NavigationLink(destination: SuggestedTripsView()) {
                            DashboardShortcutView(icon: "airplane", title: "Sugestões", color: Color.orange)
                        }
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Gastos Recentes")
                            .font(.headline)

                        ForEach(recentExpenses, id: \.self) { expense in
                            NavigationLink(destination: ExpenseDetailView(expenseDetail: expense)) {
                                HStack {
                                    Image(systemName: "creditcard")
                                        .foregroundColor(.azul)
                                    Text(expense)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.azul)
                                }
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                                .background(Color.azul.opacity(0.25))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Sugestões de Viagens")
                            .font(.headline)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(suggestedTrips, id: \.self) { trip in
                                    VStack {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .background(Color.orange.opacity(0.2))
                                            .cornerRadius(10)
                                        Text(trip)
                                            .font(.subheadline)
                                            .foregroundColor(.primary)
                                    }
                                    .frame(width: 120)
                                    .padding()
                                    .background(Color.laranja.opacity(0.1))
                                    .cornerRadius(15)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding()
            }
            .ignoresSafeArea()
        }
    }
}

struct DashboardShortcutView: View {
    var icon: String
    var title: String
    var color: Color

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
        }
        .frame(width: 100, height: 120)
        .background(Color.white.opacity(0.8))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct HomeDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDashboardView()
    }
}

// Mock Views for Navigation
struct CreateItineraryView: View {
    var body: some View {
        Text("Criar Roteiro")
    }
}

struct ExpensesView: View {
    var body: some View {
        Text("Gastos Recentes")
    }
}

struct SuggestedTripsView: View {
    var body: some View {
        Text("Sugestões de Viagens")
    }
}

struct ExpenseDetailView: View {
    var expenseDetail: String

    var body: some View {
        VStack {
            Text("Detalhes do Gasto")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Gasto selecionado: \(expenseDetail)")
                .font(.body)
                .padding()

            Spacer()
        }
        .navigationTitle("Detalhes do Gasto")
    }
}
