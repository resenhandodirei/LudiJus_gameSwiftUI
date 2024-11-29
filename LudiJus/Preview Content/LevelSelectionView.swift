//
//  LevelSelectionView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct LevelSelectionView: View {
    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color.orangePrimary, Color.blueSecondary]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Título da tela
                Text("Seleção de Nível")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Escolha um nível para iniciar os desafios!")
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Botões de Níveis
                VStack(spacing: 20) {
                    LevelButton(level: "Fácil", description: "Desafios introdutórios para aprender o básico.", color: .bluePrimary) {
                        print("Nível Fácil selecionado!")
                    }
                    
                    LevelButton(level: "Médio", description: "Coloque seus conhecimentos à prova com desafios intermediários.", color: .orangeSecondary) {
                        print("Nível Médio selecionado!")
                    }
                    
                    LevelButton(level: "Difícil", description: "Aventura máxima! Teste suas habilidades jurídicas.", color: .bluePrimary) {
                        print("Nível Difícil selecionado!")
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding()
        }
    }
}

// Subview para os botões de nível
struct LevelButton: View {
    let level: String
    let description: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading) {
                    Text(level)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .background(color)
            .cornerRadius(10)
            .shadow(color: .white.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

struct LevelSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectionView()
    }
}
