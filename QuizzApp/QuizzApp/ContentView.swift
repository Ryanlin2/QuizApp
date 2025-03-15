//
//  ContentView.swift
//  QuizzApp
//
//  Created by Ryan Lin on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var question = Question(
        problem: "What does iOS stand for?",
        answerChoice: [
            Answer(text: "iPhone Operating System", isCorrect: true),
            Answer(text: "Internet Operating System", isCorrect: false),
            Answer(text: "Information Operating System", isCorrect: false),
            Answer(text: "Intelligent Operating System", isCorrect: false)
        ]
    )
    var body: some View {
        QuestionView(question: question)
    }
}

#Preview {
    ContentView()
}
