//
//  BehavioralTestView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 19/11/24.
//

import SwiftUI

struct BehavioralTestView: View {
    @State private var currentQuestionIndex = 0
    @State private var answers: [String] = []
    @State private var showResult = false
    @State private var resultMessage = ""

    // Lista de perguntas e opções
    let questions: [(question: String, options: [String])] = [
        ("Qual tipo de lugar você prefere para viajar?", ["Praia", "Montanha", "Cidade", "Campo"]),
        ("Você gosta de atividades ao ar livre?", ["Sim, amo!", "Às vezes", "Não muito", "Prefiro ficar em ambientes fechados"]),
        ("Qual a sua preferência em viagens?", ["Aventura", "Relaxamento", "Exploração cultural", "Gastronomia"]),
        ("Você gosta de viajar em grupo?", ["Sim, com amigos/família", "Depende", "Prefiro sozinho"]),
        ("Qual seria o seu destino dos sonhos?", ["Maldivas", "Alpes Suíços", "Nova York", "Toscana"])
    ]

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Pergunta atual
            Text(questions[currentQuestionIndex].question)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            // Opções de resposta
            VStack(spacing: 15) {
                ForEach(questions[currentQuestionIndex].options, id: \.self) { option in
                    Button(action: {
                        selectAnswer(option)
                    }) {
                        Text(option)
                            .textCase(.lowercase)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.azul)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("amareloEnergizante")]),
                                   startPoint: .top,
                                   endPoint: .bottom))
        .ignoresSafeArea()
        .alert(isPresented: $showResult) {
            Alert(
                title: Text("Resultado do Teste"),
                message: Text(resultMessage),
                dismissButton: .default(Text("Entendi"))
            )
        }
    }

    // Função para salvar resposta e avançar
    private func selectAnswer(_ answer: String) {
        answers.append(answer)

        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            calculateResult()
        }
    }

    // Função para calcular o resultado
    private func calculateResult() {
        // Lógica básica para calcular o resultado
        if answers.contains("Aventura") {
            resultMessage = "Você é uma pessoa aventureira! Roteiros de aventura são perfeitos para você."
        } else if answers.contains("Relaxamento") {
            resultMessage = "Você valoriza momentos de paz e relaxamento. Destinos tranquilos são ideais para você."
        } else {
            resultMessage = "Você gosta de explorar e experimentar coisas novas! Um mix de aventuras culturais e gastronômicas será perfeito."
        }

        showResult = true
    }
}

struct BehavioralTestView_Previews: PreviewProvider {
    static var previews: some View {
        BehavioralTestView()
    }
}
