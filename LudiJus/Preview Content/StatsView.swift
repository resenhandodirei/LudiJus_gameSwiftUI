//
//  StatsView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct StatsView: View {
    @State private var totalPlayTime: TimeInterval = 1234 // Exemplo de tempo de jogo em segundos
    @State private var totalScore: Int = 8765 // Exemplo de pontuação total
    @State private var currentLevel: Int = 5 // Nível atual do jogador
    @State private var progress: Double = 0.75 // Progresso geral, 75%

    // Função para formatar o tempo em formato "MM:SS"
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [Color.orangeSecondary, Color.bluePrimary]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Título da tela
                Text("Estatísticas do Jogo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.nude)
                    .padding(.top, 40)
                
                // Tempo de Jogo
                VStack(alignment: .leading) {
                    Text("Tempo de Jogo")
                        .font(.headline)
                        .foregroundColor(.nude)
                    
                    Text(formatTime(totalPlayTime))
                        .font(.title)
                        .foregroundColor(.nude)
                        .padding(.horizontal, 40)
                }

                // Pontuação
                VStack(alignment: .leading) {
                    Text("Pontuação Total")
                        .font(.headline)
                        .foregroundColor(.nude)
                    
                    Text("\(totalScore) pontos")
                        .font(.title)
                        .foregroundColor(.nude)
                        .padding(.horizontal, 40)
                }

                // Nível Atual
                VStack(alignment: .leading) {
                    Text("Nível Atual")
                        .font(.headline)
                        .foregroundColor(.nude)
                    
                    Text("Nível \(currentLevel)")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                }

                // Progresso Geral
                VStack(alignment: .leading) {
                    Text("Progresso Geral")
                        .font(.headline)
                        .foregroundColor(.nude)
                    
                    ProgressView(value: progress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .orange))
                        .padding(.horizontal, 40)
                    
                    Text(String(format: "%.0f%%", progress * 100))
                        .font(.title2)
                        .foregroundColor(.nude)
                        .padding(.horizontal, 40)
                }
                
                // Feedback de Desempenho
                VStack(alignment: .center) {
                    Text("Desempenho:")
                        .font(.headline)
                        .foregroundColor(.nude)
                    
                    // Avaliação de desempenho
                    Text(getPerformanceFeedback())
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                        .padding(.top, 10)
                }

                // Botão de Voltar para o Jogo
                Button(action: {
                    print("Voltando ao jogo...")
                    // Lógica para voltar ao jogo
                }) {
                    Text("Voltar ao Jogo")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orangePrimary)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }
                .padding(.top, 30)
            }
            .padding()
        }
    }

    // Função para fornecer um feedback baseado no desempenho
    func getPerformanceFeedback() -> String {
        if progress == 1.0 {
            return "Excelente! Você completou todos os objetivos!"
        } else if totalScore > 8000 {
            return "Muito Bom! Continue assim!"
        } else if totalScore > 5000 {
            return "Bom, mas ainda pode melhorar!"
        } else {
            return "Continue Jogando, você pode melhorar!"
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
