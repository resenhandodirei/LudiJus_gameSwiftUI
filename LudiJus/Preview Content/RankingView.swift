//
//  RankingView.swift
//  LudiJus
//
//  Created by Larissa Martins Correa on 29/11/24.
//

import SwiftUI

struct RankingView: View {
    @State private var rankingType: RankingType = .local // Controla se o ranking é local ou global
    @State private var players: [Player] = [] // Lista de jogadores com suas pontuações

    var body: some View {
        ZStack {
            // Fundo com gradiente
            LinearGradient(gradient: Gradient(colors: [Color.bluePrimary, Color.orangePrimary]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Título de Ranking
                Text("Ranking de Melhores Jogadores")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.nude)
                    .padding(.top, 30)
                
                Picker("Tipo de Ranking", selection: $rankingType) {
                    Text("Local").tag(RankingType.local)
                    Text("Global").tag(RankingType.global)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 40)
                .padding(.top, 20)

                // Lista de jogadores no ranking
                List(players) { player in
                    HStack {
                        // Posição do jogador
                        Text("\(player.rank)")
                            .font(.headline)
                            .foregroundColor(.bluePrimary)
                            .frame(width: 40)

                        // Nome do jogador
                        Text(player.name)
                            .font(.headline)
                            .foregroundColor(.bluePrimary)
                            .frame(width: 150, alignment: .leading)

                        // Pontuação do jogador
                        Text("\(player.score)")
                            .font(.headline)
                            .foregroundColor(.yellow)
                            .frame(width: 80, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    .background(player.rank % 2 == 0 ? Color.nude.opacity(0.1) : Color.clear) // Alterna a cor de fundo
                    .cornerRadius(10)
                }
                .padding(.horizontal, 20)

                // Botões de navegação
                VStack(spacing: 20) {
                    Button(action: onBackToMenu) {
                        Text("Voltar ao Menu Principal")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.nude)
                            .padding()
                            .background(Color.bluePrimary)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }

                    Button(action: onContinuePlaying) {
                        Text("Continuar Jogando")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.bluePrimary)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                }
                .padding(.top, 30)
            }
            .padding()
            .onAppear {
                fetchRankingData()
            }
        }
    }

    // Função para buscar dados de ranking (simulação)
    private func fetchRankingData() {
        // Simula o carregamento de dados de ranking
        if rankingType == .local {
            players = [
                Player(rank: 1, name: "Jogador 1", score: 1500),
                Player(rank: 2, name: "Jogador 2", score: 1200),
                Player(rank: 3, name: "Jogador 3", score: 1100),
            ]
        } else {
            players = [
                Player(rank: 1, name: "Jogador Global 1", score: 3000),
                Player(rank: 2, name: "Jogador Global 2", score: 2500),
                Player(rank: 3, name: "Jogador Global 3", score: 2300),
            ]
        }
    }

    // Ação para voltar ao menu principal
    private func onBackToMenu() {
        // Implementar navegação para o menu principal
    }

    // Ação para continuar jogando
    private func onContinuePlaying() {
        // Implementar navegação para continuar jogando
    }
}

enum RankingType {
    case local
    case global
}

struct Player: Identifiable {
    var id = UUID()
    var rank: Int
    var name: String
    var score: Int
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}
