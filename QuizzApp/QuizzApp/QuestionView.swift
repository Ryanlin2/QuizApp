//
//  QuestionView.swift
//  QuizzApp
//
//  Created by Ryan Lin on 3/15/25.
//

import SwiftUI

struct QuestionView: View {
    let question: Question
    @State private var columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack(spacing: 20) {
            
            Text("Quizz App")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
            
            Spacer()
            
            Text(question.problem)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(question.answerChoice) { choice in
                    Button(action: {
                        print(choice.isCorrect)
                    }) {
                        Text(choice.text)
                            .font(.headline)
                            .frame(width: 180, height: 60)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
            .padding(.horizontal,0)

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.bottom)
    }
}

