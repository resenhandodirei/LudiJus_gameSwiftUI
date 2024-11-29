//
//  ExtraModesView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct ExtraModesView: View {
    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [Color.bluePrimary, Color.orangePrimary]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                // Título da tela
                Text("Modos Extras")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)

                // Desafio Rápido
                Button(action: {
                    // Ação para iniciar o Desafio Rápido
                    print("Iniciando Desafio Rápido...")
                }) {
                    Text("Desafio Rápido")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orangeSecondary)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }

                // Quiz
                Button(action: {
                    // Ação para iniciar o Quiz
                    print("Iniciando Quiz...")
                }) {
                    Text("Quiz")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blueSecondary)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }

                // Modo Infinito
                Button(action: {
                    // Ação para iniciar o Modo Infinito
                    print("Iniciando Modo Infinito...")
                }) {
                    Text("Modo Infinito")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orangeSecondary)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }
                Button(action: {
                    // Lógica para voltar ao menu principal
                    print("Voltando ao Menu Principal...")
                }) {
                    Text("Voltar")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blueSecondary)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }
                
            }
            .padding()
        }
    }
}

struct ExtraModesView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraModesView()
    }
}
