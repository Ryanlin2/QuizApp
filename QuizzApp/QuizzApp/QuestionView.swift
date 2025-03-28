//
//  QuestionView.swift
//  QuizzApp
//
//  Created by Ryan Lin on 3/15/25.
//

import SwiftUI

struct QuestionView: View {
    
    let question: Question
    var quiz = QuizMaintainer()
    @State private var columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var shakeUnits: CGFloat = 0
    @State private var scale : CGFloat = 1.0
    @State private var selectedChoice: UUID?
    @State private var isCorrect = false
    @State private var isShaking = false
    @State private var ampilfyanimation = false
    
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
                
                ForEach(question.answerChoice, id: \.self.id) { choice in
                    ChoiceView(
                        choice: choice,
                        selectedChoice: selectedChoice,
                        isCorrect: isCorrect,
                        scale: scale,
                        isShaking: isShaking
                    )
                        .onTapGesture {
                            selectedChoice = choice.id
                            if choice.isCorrect {
                                isCorrect = true
                                quiz.correctScore += 1
                                print("true")
                                
                                withAnimation(.easeOut(duration: 0.5)) {
                                    ampilfyanimation = true
                                    scale = 20.0
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                    ampilfyanimation = false
                                    quiz.nextQuestion()
                                    withAnimation(.easeIn(duration: 0.3)){
                                        scale = 1.0
                                    }
                                    selectedChoice = nil
                                }
                            }
                            else {
                                isCorrect = false
                                print("false")
                                quiz.incorrectScore += 1
                                withAnimation(.default.repeatCount(1, autoreverses: true)) {
                                    isShaking = true
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isShaking = false
                                    selectedChoice = nil
                                }
                            }
                        }
                }
            }
            Spacer()
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.bottom)
        Spacer()
    }
}


struct ChoiceView: View {
    let choice: Answer
    let selectedChoice: UUID?
    let shakeUnits: CGFloat = 10
    let isCorrect: Bool
    let scale: CGFloat
    let isShaking: Bool
    
    var body: some View {
        Text(choice.text)
            .font(.headline)
            .frame(width: 180, height: 60)
            .background(backgroundColor(for: choice))
            .foregroundColor(.white)
            .background(Capsule().fill(!isCorrect ? Color.red : Color.blue))
            .shadow(radius: 5)
            .clipShape(Capsule())
            .modifier(choice.id == selectedChoice && isShaking ? ShakeEffect(animatableData: shakeUnits) : ShakeEffect(animatableData: 0))
            .scaleEffect(choice.id == selectedChoice && isCorrect ? scale : 1.0, anchor: .bottom)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5), value: choice.id == selectedChoice && isCorrect)
    }
    
    func backgroundColor(for choice: Answer) -> Color {
        if selectedChoice == choice.id {
            return isCorrect ? .green : .red
        }
        return .blue
    }

}


struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let translationX = 10 * sin(animatableData * .pi * CGFloat(3))
        return ProjectionTransform(
            CGAffineTransform(translationX: translationX, y: 30)
        )
    }
}

#Preview {
    let question = Question(
        problem: "What does iOS stand for?",
        answerChoice: [
            Answer(text: "iPhone Operating System", isCorrect: true),
            Answer(text: "Internet Operating System", isCorrect: false),
            Answer(text: "Information Operating System", isCorrect: false),
            Answer(text: "Intelligent Operating System", isCorrect: false)
        ]
    )
    
    QuestionView(question: question)
        .environment(QuizMaintainer())
}
