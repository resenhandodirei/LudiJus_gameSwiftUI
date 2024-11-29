//
//  FeedbackView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct FeedbackView: View {
    var isCorrect: Bool
    var feedbackMessage: String
    var onNextQuestion: () -> Void
    var onGameOver: () -> Void
    
    var body: some View {
        ZStack {
            // Fundo com gradiente (cenário)
            LinearGradient(
                gradient: Gradient(colors: [Color.bluePrimary, Color.orangePrimary]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()

                // Feedback de resposta
                Text(feedbackMessage)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(isCorrect ? .green : .red)
                    .padding()
                    .multilineTextAlignment(.center)

                // Botão para continuar para a próxima pergunta ou terminar o jogo
                Button(action: {
                    if isCorrect {
                        onNextQuestion()
                    } else {
                        onGameOver()
                    }
                }) {
                    Text(isCorrect ? "Próxima Pergunta" : "Fim de Jogo")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isCorrect ? Color.green : Color.red)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(
            isCorrect: true,
            feedbackMessage: "Resposta Correta!",
            onNextQuestion: { print("Próxima Pergunta") },
            onGameOver: { print("Fim de Jogo") }
        )
    }
}
