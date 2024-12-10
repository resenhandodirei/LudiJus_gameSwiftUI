//
//  MainMenuView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView { // Remover os parênteses vazios aqui
            ZStack {
                // Fundo com gradiente
                LinearGradient(
                    gradient: Gradient(colors: [Color.bluePrimary, Color.orangeSecondary]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 40) {
                    // Título da Tela
                    Text("LudiJus")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Escolha o modo ou nível para começar sua aventura!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // Botões de Níveis
                    VStack(spacing: 20) {
                        NavigationLink(destination: LevelSelectionView()) {
                            MenuButtonView(title: "Fácil", color: .bluePrimary)
                        }
                        
                        NavigationLink(destination: LevelSelectionView()) {
                            MenuButtonView(title: "Médio", color: .orangePrimary)
                        }
                        
                        NavigationLink(destination: LevelSelectionView()) {
                            MenuButtonView(title: "Difícil", color: .blueSecondary)
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    // Botões de Modos Extras
                    VStack(spacing: 20) {
                        NavigationLink(destination: ExtraModesView()) {
                            MenuButtonView(title: "Modos Extras", color: .orangeSecondary)
                        }
                        
                        NavigationLink(destination: CustomizationView()) {
                            MenuButtonView(title: "Customizar", color: .bluePrimary)
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    // Botões de Configurações e Ajuda
                    VStack(spacing: 20) {
                        NavigationLink(destination: SettingsView()) {
                            MenuButtonView(title: "Configurações", color: .blueSecondary)
                        }
                        
                        NavigationLink(destination: HelpView()) {
                            MenuButtonView(title: "Ajuda", color: .orangePrimary)
                        }
                    }
                    .padding(.horizontal, 40)
                    
                    // Botão de Sair
                    Button(action: {
                        exit(0) // Sair do aplicativo
                    }) {
                        MenuButtonView(title: "Sair", color: .red)
                    }
                    .padding(.horizontal, 40)
                }
                .padding()
            }
        }
    }
}

// Subview para Botões do Menu
struct MenuButtonView: View {
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(10)
            .shadow(color: .white.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}



struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
