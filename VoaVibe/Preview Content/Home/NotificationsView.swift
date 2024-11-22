//
//  NotificationsView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct NotificationsView: View {
    // Modelo para uma notificação
    struct Notification: Identifiable {
        let id = UUID()
        let title: String
        let description: String
        let date: String
        let category: String
    }
    
    // Lista de notificações (dados simulados)
    let notifications: [Notification] = [
        Notification(title: "Promoção de Verão!", description: "Descontos de até 30% em pacotes para destinos tropicais.", date: "Hoje", category: "Promoção"),
        Notification(title: "Lembrete de Viagem", description: "Sua viagem para Bali começa em 2 dias. Não se esqueça de revisar o checklist.", date: "Ontem", category: "Lembrete"),
        Notification(title: "Atualização do App", description: "Nova funcionalidade: Acompanhamento de gastos agora com gráficos interativos!", date: "3 dias atrás", category: "Atualização"),
        Notification(title: "Explore Novos Destinos", description: "Conheça os destinos mais populares baseados no seu perfil.", date: "Semana passada", category: "Sugestão"),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Cabeçalho da tela
                VStack(alignment: .leading, spacing: 8) {
                    Text("Notificações")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.azul)
                    
                    Text("Fique por dentro das atualizações, promoções e lembretes!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                // Lista de notificações
                List(notifications) { notification in
                    NotificationRow(notification: notification)
                }
                .listStyle(InsetGroupedListStyle())
            }
//            .navigationTitle("Notificações")
        }
    }
}

// Componente para exibir uma notificação
struct NotificationRow: View {
    let notification: NotificationsView.Notification
    
    var body: some View {
        HStack(alignment: .top) {
            // Ícone baseado na categoria
            Image(systemName: iconForCategory(notification.category))
                .foregroundColor(colorForCategory(notification.category))
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .font(.headline)
                
                Text(notification.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(notification.date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
    
    // Função para definir ícone por categoria
    private func iconForCategory(_ category: String) -> String {
        switch category {
        case "Promoção": return "tag.fill"
        case "Lembrete": return "bell.fill"
        case "Atualização": return "arrow.triangle.2.circlepath"
        case "Sugestão": return "lightbulb.fill"
        default: return "envelope.fill"
        }
    }
    
    // Função para definir cor por categoria
    private func colorForCategory(_ category: String) -> Color {
        switch category {
        case "Promoção": return .pink
        case "Lembrete": return .blue
        case "Atualização": return .green
        case "Sugestão": return .orange
        default: return .gray
        }
    }
}

// Preview
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
