//
//  WelcomeView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

// Tela de Boas-Vindas (WelcomeView)
struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Fundo com gradiente azul e laranja
                LinearGradient(
                    gradient: Gradient(colors: [Color.bluePrimary, Color.orangePrimary]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 40) {
                    VStack(spacing: 10) {
                        Text("LudiJus")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.nude)
                        
                        Text("Explore o universo jurídico de forma divertida!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    
                    Image("themis") // Certifique-se de que "themis" está no Assets.xcassets
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    // NavigationLink corretamente configurado
                    NavigationLink(destination: MainMenuView()) {
                        Text("Jogar")
                            .font(.title2)
                            .textCase(.lowercase)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blueSecondary)
                            .cornerRadius(10)
                            .shadow(color: .white.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal, 40)
                }
                .padding()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
