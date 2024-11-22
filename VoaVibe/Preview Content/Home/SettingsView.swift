//
//  SettingsView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled: Bool = true
    @State private var darkModeEnabled: Bool = false
    @State private var selectedTheme: String = "Padrão"
    @State private var isPreferencesPresented: Bool = false

    let themes = ["Padrão", "Claro", "Escuro", "Pastel"]

    var body: some View {
        NavigationView {
            VStack {
                Text("Configurações")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.azul)
                
                Form {
                    // Notificações
                    Section(header: Text("Notificações")) {
                        Toggle("Habilitar notificações", isOn: $notificationsEnabled)
                            .accentColor(Color("amareloEnergizante")) // Usando a cor personalizada
                    }

                    // Temas
                    Section(header: Text("Tema do aplicativo")) {
                        Picker("Selecione um tema", selection: $selectedTheme) {
                            ForEach(themes, id: \.self) { theme in
                                Text(theme)
                            }
                        }
                    }

                    // Preferências
                    Section(header: Text("Preferências")) {
                        Button(action: {
                            isPreferencesPresented.toggle()
                        }) {
                            HStack {
                                Text("Editar preferências")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        .sheet(isPresented: $isPreferencesPresented) {
                            PreferencesView()
                        }
                    }

                    // Informações do App
                    Section(header: Text("Sobre")) {
                        NavigationLink(destination: AboutView()) {
                            Text("Sobre o aplicativo")
                        }
                    }
                }
    //            .navigationTitle("Configurações")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PreferencesView: View {
    var body: some View {
        VStack {
            Text("Preferências do Usuário")
                .font(.headline)
                .padding()
            Text("Aqui você pode personalizar ainda mais sua experiência.")
                .font(.subheadline)
                .padding()

            Spacer()
        }
    }
}

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Sobre o Voavibe")
                .font(.headline)
                .padding()
            Text("Voavibe é um aplicativo que ajuda você a planejar viagens e explorar destinos que combinam com sua personalidade.")
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
