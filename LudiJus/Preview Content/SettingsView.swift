//
//  SettingsView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var volume: Double = 0.5
    @State private var notificationsEnabled: Bool = true
    @State private var darkModeEnabled: Bool = false
    @State private var selectedLanguage: String = "Português"
    
    let languages = ["Português", "Inglês", "Espanhol", "Francês"]

    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [Color.bluePrimary, Color.orangePrimary]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Título da tela
                Text("Configurações")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                // Controle de volume
                VStack(alignment: .leading) {
                    Text("Volume")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Slider(value: $volume, in: 0...1, step: 0.1)
                        .accentColor(.orange)
                        .padding(.horizontal, 40)
                    
                    Text("Volume: \(Int(volume * 100))%")
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                }
                
                // Controle de notificações
                VStack(alignment: .leading) {
                    Text("Notificações")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Toggle(isOn: $notificationsEnabled) {
                        Text(notificationsEnabled ? "Ativar" : "Desativar")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 40)
                }
                
                // Modo escuro
                VStack(alignment: .leading) {
                    Text("Modo Escuro")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Toggle(isOn: $darkModeEnabled) {
                        Text(darkModeEnabled ? "Ativado" : "Desativado")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 40)
                }
                
                // Seleção de idioma
                VStack(alignment: .leading) {
                    Text("Idioma")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Picker("Idioma", selection: $selectedLanguage) {
                        ForEach(languages, id: \.self) { language in
                            Text(language)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal, 40)
                }
                
                // Botão de Salvar e Voltar
                Button(action: {
                    // Ação para salvar configurações (no futuro, você pode persistir em UserDefaults ou outra solução)
                    print("Configurações salvas: Volume \(Int(volume * 100))%, Notificações \(notificationsEnabled ? "Ativadas" : "Desativadas"), Modo Escuro \(darkModeEnabled ? "Ativado" : "Desativado"), Idioma \(selectedLanguage)")
                }) {
                    Text("Salvar Configurações")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.bluePrimary)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }
                .padding(.top, 30)
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
