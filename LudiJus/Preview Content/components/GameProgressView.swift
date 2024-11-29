//
//  GameProgressView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct GameProgressView: View {
    var currentLevel: Int
    var currentScore: Int
    var timeRemaining: Int
    
    var body: some View {
        HStack {
            // Pontuação
            VStack {
                Text("Pontuação")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("\(currentScore)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
            .padding()
            
            Spacer()
            
            // Tempo Restante
            VStack {
                Text("Tempo Restante")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("\(timeRemaining) s")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            .padding()

            Spacer()
            
            // Nível Atual
            VStack {
                Text("Nível")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("Nível \(currentLevel)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.bluePrimary, Color.orangePrimary]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
    }
}

struct GameProgressView_Previews: PreviewProvider {
    static var previews: some View {
        GameProgressView(currentLevel: 1, currentScore: 100, timeRemaining: 30)
            .previewLayout(.sizeThatFits)
    }
}
