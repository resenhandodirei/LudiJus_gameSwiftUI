//
//  LoginRegisterView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct LoginRegisterView: View {
    @State private var isLogin = true // Alterna entre Login e Registro
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color.orangeSecondary, Color.bluePrimary]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Título
                Text(isLogin ? "Bem-vindo de volta!" : "Crie sua conta")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(isLogin ? "Faça login para continuar sua jornada no LudiJus." : "Registre-se para salvar seu progresso.")
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Campos de entrada
                VStack(spacing: 15) {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Senha", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                    
                    // Campo extra para registro
                    if !isLogin {
                        SecureField("Confirme sua Senha", text: $confirmPassword)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                // Botão de ação
                Button(action: {
                    if isLogin {
                        print("Tentando login com email: \(email)")
                    } else {
                        print("Tentando registro com email: \(email)")
                    }
                }) {
                    Text(isLogin ? "Entrar" : "Registrar")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(color: .white.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal, 40)
                
                // Alternar entre Login e Registro
                Button(action: {
                    isLogin.toggle()
                }) {
                    Text(isLogin ? "Não tem uma conta? Registre-se aqui." : "Já tem uma conta? Faça login.")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.top, 10)
            }
            .padding()
        }
    }
}

struct LoginRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView()
    }
}
