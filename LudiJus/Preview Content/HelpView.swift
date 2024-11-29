//
//  HelpView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [Color.orangeSecondary, Color.blueSecondary]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Título da tela
                Text("Como Jogar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                // Texto explicativo sobre o jogo
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Objetivo do Jogo:")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("O objetivo do jogo é responder a perguntas relacionadas às matérias de direito. Cada nível tem um tema diferente, e o jogador deve escolher a resposta correta para avançar.")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Text("Regras:")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("1. Responda corretamente para acumular pontos.\n2. Cada fase tem um tempo limite.\n3. Ao errar uma resposta, você perde pontos e tempo.\n4. Complete todas as fases para vencer o jogo.")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Text("Dicas e Truques:")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("1. Responda rapidamente para ganhar mais pontos.\n2. Leia as perguntas com atenção antes de responder.\n3. Use as dicas de cada fase se necessário.")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                
                // Imagem explicativa (opcional)
                Image("game_instructions_image") // Substitua pelo nome da sua imagem
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .padding(.top, 20)
                
                // Botão para voltar
                Button(action: {
                    // Ação de voltar à tela anterior (exemplo: fechar ou voltar ao menu principal)
                    print("Voltar ao Menu Principal")
                }) {
                    Text("Voltar ao Jogo")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orangeSecondary)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }
                .padding(.top, 30)
            }
            .padding()
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
