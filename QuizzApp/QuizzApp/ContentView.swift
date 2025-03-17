//
//  ContentView.swift
//  QuizzApp
//
//  Created by Ryan Lin on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    let questions: [Question] = [
            Question(problem: "What does iOS stand for?",
                     answerChoice: [
                        Answer(text: "iPhone Operating System", isCorrect: true),
                        Answer(text: "Internet Operating System", isCorrect: false),
                        Answer(text: "Information Operating System", isCorrect: false),
                        Answer(text: "Intelligent Operating System", isCorrect: false)
                     ]),
            Question(problem: "What is Swift?",
                     answerChoice: [
                        Answer(text: "A programming language developed by Apple", isCorrect: true),
                        Answer(text: "A web browser", isCorrect: false),
                        Answer(text: "A cloud storage service", isCorrect: false),
                        Answer(text: "An AI assistant", isCorrect: false)
                     ]),
            Question(problem: "Which framework is used for building iOS user interfaces?",
                     answerChoice: [
                        Answer(text: "SwiftUI", isCorrect: true),
                        Answer(text: "UIKit", isCorrect: false),
                        Answer(text: "CoreData", isCorrect: false),
                        Answer(text: "AVFoundation", isCorrect: false)
                     ]),
            Question(problem: "Which language is primarily used for iOS development?",
                     answerChoice: [
                        Answer(text: "Swift", isCorrect: true),
                        Answer(text: "Python", isCorrect: false),
                        Answer(text: "Java", isCorrect: false),
                        Answer(text: "C++", isCorrect: false)
                     ])
        ]
    
    @State var quizStarted = false
    @State var numCorrect:Int = 0

    var body: some View {
        NavigationStack{
            if quizStarted==false {
                WelcomeView(quizStarted:$quizStarted)
            }
            else{
                NavigationStack{
                    if questions[0].answered == false{
                        QuestionView(question:questions[0])
                    }
                    else if questions[1].answered == false{
                        QuestionView(question:questions[1])
                    
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
