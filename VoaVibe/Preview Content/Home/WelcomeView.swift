//
//  WelcomeView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 18/11/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.amareloEnergizante)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 40) {
                    Image(systemName: "airplane.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(Color("azul").opacity(2.0))
                    
                    Text("Explore o mundo com o VoaVibe")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("azul").opacity(1.0))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    NavigationLink(destination: NextView()) { // Substitua `NextView` pela próxima tela
                        Text("Começar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("azul").opacity(1.0))  
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)
                }
                .padding()
            }
        }
    }
}

// Substitua `NextView` pela próxima tela
struct NextView: View {
    var body: some View {
        Text("Próxima tela aqui!")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
