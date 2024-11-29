//
//  GamePlayView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct GamePlayView: View {
    @State private var currentQuestionIndex = 0
    @State private var playerScore = 0
    @State private var selectedAnswer: String? = nil
    @State private var isAnswerCorrect: Bool? = nil
    @State private var showFeedback = false
    
    let questions = [
        Question(
            questionText: "Qual a principal função da Constituição Federal?",
            options: ["Organizar os Poderes", "Definir as leis civis", "Regular o processo penal", "Estabelecer as normas tributárias"],
            correctAnswer: "Organizar os Poderes"
        ),
        Question(
            questionText: "O que caracteriza o princípio da legalidade?",
            options: ["Somente a lei pode criar obrigações", "A Constituição deve ser interpretada literalmente", "A jurisprudência é a norma principal", "O Estado pode agir sem limites"],
            correctAnswer: "Somente a lei pode criar obrigações"
        ),
        Question(
            questionText: "O que é a cláusula pétrea?",
            options: ["Princípios imutáveis da Constituição", "Normas infraconstitucionais", "Decisões judiciais definitivas", "Leis estaduais e municipais"],
            correctAnswer: "Princípios imutáveis da Constituição"
        )
    ]
    
    var body: some View {
        ZStack {
            // Fundo com gradiente (Cenário visual do jogo)
            LinearGradient(
                gradient: Gradient(colors: [Color.bluePrimary, Color.orangePrimary]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Título e pontuação
                HStack {
                    Text("LudiJus")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Pontuação: \(playerScore)")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding()

                // Pergunta atual
                Text(questions[currentQuestionIndex].questionText)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)

                // Opções de resposta
                VStack(spacing: 15) {
                    ForEach(questions[currentQuestionIndex].options, id: \.self) { option in
                        AnswerButton(answer: option, isSelected: selectedAnswer == option) {
                            selectedAnswer = option
                            checkAnswer(selectedAnswer)
                        }
                    }
                }
                .padding(.top, 30)

                // Feedback de resposta
                if showFeedback {
                    Text(isAnswerCorrect == true ? "Resposta Correta!" : "Resposta Errada")
                        .font(.headline)
                        .foregroundColor(isAnswerCorrect == true ? .green : .red)
                        .padding(.top, 20)
                }

                Spacer()

                // Botão para continuar para a próxima pergunta
                if showFeedback {
                    Button(action: {
                        nextQuestion()
                    }) {
                        Text("Próxima Pergunta")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orangeSecondary)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    }
                    .padding(.horizontal, 40)
                }
            }
            .padding()
        }
    }
    
    // Função para verificar a resposta
    private func checkAnswer(_ answer: String?) {
        guard let selectedAnswer = answer else { return }
        let correctAnswer = questions[currentQuestionIndex].correctAnswer
        isAnswerCorrect = selectedAnswer == correctAnswer
        
        // Atualiza a pontuação se a resposta for correta
        if isAnswerCorrect == true {
            playerScore += 10
        }
        
        showFeedback = true
    }

    // Função para ir para a próxima pergunta
    private func nextQuestion() {
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
            selectedAnswer = nil
            isAnswerCorrect = nil
            showFeedback = false
        } else {
            // Se o jogo terminar
            print("Fim de jogo. Sua pontuação final foi \(playerScore)")
        }
    }
}

struct AnswerButton: View {
    var answer: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(answer)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.green : Color.white.opacity(0.7))
                .foregroundColor(isSelected ? .white : .black)
                .cornerRadius(10)
                .shadow(color: isSelected ? Color.green.opacity(0.5) : Color.clear, radius: 5)
        }
    }
}

// Modelo para as perguntas
struct Question {
    var questionText: String
    var options: [String]
    var correctAnswer: String
}

struct GamePlayView_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView()
    }
}
