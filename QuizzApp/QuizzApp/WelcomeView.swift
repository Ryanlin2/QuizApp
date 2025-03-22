//
//  WelcomeView.swift
//  QuizzApp
//
//  Created by Esteban Linarez  on 3/22/25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var startGame: Bool
    
    var body: some View {
        VStack {
            Text("Welcome to QuizzApp")
                .font(.largeTitle)
            Text("Press Start to begin")
                .font(.headline)
            
            Button("Start") {
                withAnimation {
                    startGame = true
                }
            }
            .padding(20)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        
            
        }
    }
}

#Preview {
    WelcomeView(startGame: .constant(false))
}
