//
//  CharacterCustomizationView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct CharacterCustomizationView: View {
    @State private var selectedSex: String = "Masculino"
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var favoriteSubject: String = "Civil"
    @State private var hatedSubject: String = "Processual Penal"
    @State private var showConfirmationAlert: Bool = false

    let subjects = ["Civil", "Constitucional", "Empresarial", "Processual Civil", "Processual Penal", "Penal", "Administrativo", "Tributário"]

    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color.orangePrimary, Color.bluePrimary]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(spacing: 20) {
                    // Título da tela
                    Text("Personalize seu Personagem")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    // Campo para Nome
                    TextField("Nome do Personagem", text: $name)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)

                    // Campo para Idade
                    TextField("Idade", text: $age)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)

                    // Escolha de Sexo
                    VStack {
                        Text("Sexo Biológico")
                            .foregroundColor(.white)
                            .font(.headline)

                        HStack {
                            Button(action: {
                                selectedSex = "Masculino"
                            }) {
                                Text("Masculino")
                                    .padding()
                                    .background(selectedSex == "Masculino" ? Color.blue : Color.white.opacity(0.7))
                                    .foregroundColor(selectedSex == "Masculino" ? .white : .black)
                                    .cornerRadius(10)
                            }

                            Button(action: {
                                selectedSex = "Feminino"
                            }) {
                                Text("Feminino")
                                    .padding()
                                    .background(selectedSex == "Feminino" ? Color.pink : Color.white.opacity(0.7))
                                    .foregroundColor(selectedSex == "Feminino" ? .white : .black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.top, 20)

                    // Matéria Preferida
                    VStack(alignment: .leading) {
                        Text("Matéria Preferida")
                            .foregroundColor(.white)
                            .font(.headline)

                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                            ForEach(subjects, id: \ .self) { subject in
                                Button(action: {
                                    if subject != hatedSubject {
                                        favoriteSubject = subject
                                    }
                                }) {
                                    Text(subject)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(favoriteSubject == subject ? Color.green : Color.white.opacity(0.7))
                                        .foregroundColor(favoriteSubject == subject ? .white : .black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 40)

                    // Matéria Odiada
                    VStack(alignment: .leading) {
                        Text("Matéria Odiada")
                            .foregroundColor(.white)
                            .font(.headline)

                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                            ForEach(subjects, id: \ .self) { subject in
                                Button(action: {
                                    if subject != favoriteSubject {
                                        hatedSubject = subject
                                    }
                                }) {
                                    Text(subject)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(hatedSubject == subject ? Color.red : Color.white.opacity(0.7))
                                        .foregroundColor(hatedSubject == subject ? .white : .black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 40)

                    // Botão de Confirmação
                    Button(action: {
                        showConfirmationAlert = true
                    }) {
                        Text("Confirmar Personagem")
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
                    .alert(isPresented: $showConfirmationAlert) {
                        Alert(
                            title: Text("Personagem Personalizado"),
                            message: Text("Nome: \(name)\nIdade: \(age)\nSexo: \(selectedSex)\nMatéria Preferida: \(favoriteSubject)\nMatéria Odiada: \(hatedSubject)"),
                            dismissButton: .default(Text("Ok"))
                        )
                    }
                }
                .padding()
            }
        }
    }
}

struct CharacterCustomizationView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCustomizationView()
    }
}
