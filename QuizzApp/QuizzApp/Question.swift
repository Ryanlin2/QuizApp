//
//  Question.swift
//  QuizzApp
//
//  Created by Ryan Lin on 3/15/25.
//

import Foundation

struct Question : Identifiable {
    let id = UUID()
    let problem: String
    let answerChoice: [Answer]
}


struct Answer : Identifiable {
    let id = UUID()
    let text: String
    let isCorrect: Bool
}

@Observable
class QuizMaintainer {
    var questions: [Question] = []
    var currentIndex: Int = 0
    var correctScore: Int = 0
    var incorrectScore: Int = 0
    var totalScore: Double = 0
    var showScore: Bool = false
    
    init() {
        loadQuestions()
    }
    
    func loadQuestions() {
        questions =  [
            Question(problem: "What does iOS stand for?",
                     answerChoice: [
                        Answer(text: "iPhone Operating System", isCorrect: true),
                        Answer(text: "Internet Operating System", isCorrect: false),
                        Answer(text: "Information Operating System", isCorrect: false),
                        Answer(text: "Intelligent Operating System", isCorrect: false)
            ]),
            Question(problem: "What programming language is used for iOS",
                     answerChoice: [
                        Answer(text: "Python", isCorrect: false),
                        Answer(text: "Java", isCorrect: false),
                        Answer(text: "C++", isCorrect: false),
                        Answer(text: "Swift", isCorrect: true)
            ]),
            Question(problem: "What is the capital of France?",
                     answerChoice: [
                        Answer(text: "Paris", isCorrect: true),
                        Answer(text: "Berlin", isCorrect: false),
                        Answer(text: "Rome", isCorrect: false),
                        Answer(text: "Madrid", isCorrect: false)
            ]),
            Question(problem: "What is the largest freshwater lake in the world?",
                     answerChoice: [
                        Answer(text: "Lake Superior", isCorrect: false),
                        Answer(text: "Lake Baikal", isCorrect: false),
                        Answer(text: "Caspian Sea", isCorrect: true),
                        Answer(text: "Lake Victoria", isCorrect: false)
                     ])
        ]
        
        questions.shuffle()
    }
    
    func nextQuestion() {
        if currentIndex + 1 < questions.count {
            currentIndex += 1
        }
        else {
            showScore = true
        }
    }
    
    func resetQuiz() {
        loadQuestions()
    }
}

