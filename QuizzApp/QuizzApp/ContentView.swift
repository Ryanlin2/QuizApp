//
//  ContentView.swift
//  QuizzApp
//
//  Created by Ryan Lin on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var started = false
    @State private var finished = false
    @Environment(QuizMaintainer.self) var quiz: QuizMaintainer
    var body: some View {
        
        if !started {
            WelcomeView(startGame: $started)
                .transition(.slide)
        }
        else if quiz.showScore {
            FinishView(quiz: quiz)
        }
        else {
            QuestionView(question: quiz.questions[quiz.currentIndex], quiz: quiz)
        }
    
    }
}

#Preview {
    ContentView()
        .environment(QuizMaintainer().self)
}
