//
//  CustomizationView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct CustomizationView: View {
    @State private var selectedAvatar: String = "Avatar1" // Avatar selecionado
    @State private var selectedTheme: Color = .blue // Cor de tema selecionada
    @State private var isAccessoriesEnabled: Bool = false // Se os acessórios estão ativados

    let avatars = ["Avatar1", "Avatar2", "Avatar3", "Avatar4"]
    let themes = [Color.blue, Color.green, Color.orange, Color.purple]
    
    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [selectedTheme, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Título da tela
                Text("Personalize Seu Avatar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                // Seletor de Avatar
                Text("Escolha seu Avatar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                
                HStack {
                    ForEach(avatars, id: \.self) { avatar in
                        Button(action: {
                            selectedAvatar = avatar
                        }) {
                            Text(avatar)
                                .padding()
                                .background(selectedAvatar == avatar ? Color.white : Color.gray.opacity(0.5))
                                .foregroundColor(selectedAvatar == avatar ? .black : .white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .padding(5)
                    }
                }
                
                // Seletor de Tema
                Text("Escolha o Tema")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 30)
                
                HStack {
                    ForEach(themes, id: \.self) { theme in
                        Button(action: {
                            selectedTheme = theme
                        }) {
                            Circle()
                                .fill(theme)
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 2)
                                )
                        }
                        .padding(5)
                    }
                }
                
                // Ativar/desativar acessórios
                Toggle(isOn: $isAccessoriesEnabled) {
                    Text("Ativar Acessórios")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.top, 30)
                .padding(.horizontal, 40)
                
                // Botão para salvar as alterações
                Button(action: {
                    saveCustomization()
                }) {
                    Text("Salvar Personalização")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.orangeSecondary)
                        .padding()
                        .background(Color.nude)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .textCase(.lowercase)
                }
                .padding(.top, 40)
            }
            .padding()
        }
    }

    // Função para salvar personalização
    private func saveCustomization() {
        print("Avatar selecionado: \(selectedAvatar)")
        print("Tema selecionado: \(selectedTheme.description)")
        print("Acessórios ativados: \(isAccessoriesEnabled ? "Sim" : "Não")")
    }
}

struct CustomizationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizationView()
    }
}
