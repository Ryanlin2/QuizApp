//
//  ContentView.swift
//  QuizzApp
//
//  Created by Ryan Lin on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var started = false
    
    @State private var questions = QuizMaintainer().questions
    var body: some View {
        
        if !started {
            WelcomeView(startGame: $started)
                .transition(.slide)
        }
        else {
            QuestionView(question: questions[0])
        }
    
    }
}

#Preview {
    ContentView()
        .environment(QuizMaintainer().self)
}
