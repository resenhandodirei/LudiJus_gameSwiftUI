//
//  LevelCompletionView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//
import SwiftUI

struct LevelCompletionView: View {
    var score: Int
    var level: Int
    var onNextLevel: () -> Void
    var onMainMenu: () -> Void
    
    var feedbackMessage: String {
        if score >= 80 {
            return "Excelente! Você está arrasando!"
        } else if score >= 50 {
            return "Bom trabalho! Continue assim!"
        } else {
            return "Você pode melhorar! Tente novamente!"
        }
    }

    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [Color.bluePrimary, Color.orangeSecondary]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Título de Conclusão
                Text("Fase Concluída!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                
                // Feedback sobre desempenho
                Text(feedbackMessage)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                // Pontuação
                Text("Pontuação: \(score)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.nude)
                    .padding(.top, 10)
                
                // Botões de navegação
                VStack(spacing: 20) {
                    Button(action: onNextLevel) {
                        Text("Próximo Nível")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orangeSecondary)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                    
                    Button(action: onMainMenu) {
                        Text("Voltar ao Menu Principal")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orangeSecondary)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                }
                .padding(.top, 30)
                
            }
            .padding()
        }
    }
}

struct LevelCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        LevelCompletionView(score: 85, level: 1, onNextLevel: {}, onMainMenu: {})
            .previewLayout(.sizeThatFits)
    }
}
