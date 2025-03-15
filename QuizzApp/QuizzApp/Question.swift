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
