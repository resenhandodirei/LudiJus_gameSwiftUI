//
//  LevelSelectionView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct LevelSelectionView: View {
    var body: some View {
        NavigationView {
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
                    
                    // Botões de Níveis com NavigationLink em cada um
                    NavigationLink(destination: GamePlayView()) {
                        LevelButton(level: "Fácil", description: "Desafios introdutórios para aprender o básico.", color: .bluePrimary)
                    }

                    NavigationLink(destination: GamePlayView()) {
                        LevelButton(level: "Médio", description: "Coloque seus conhecimentos à prova com desafios intermediários.", color: .orangeSecondary)
                    }

                    NavigationLink(destination: GamePlayView()) {
                        LevelButton(level: "Difícil", description: "Aventura máxima! Teste suas habilidades jurídicas.", color: .bluePrimary)
                    }
                }
                .padding()
            }
        }
    }
}

// Subview para os botões de nível
struct LevelButton: View {
    let level: String
    let description: String
    let color: Color
    
    var body: some View {
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

struct LevelSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectionView()
    }
}
