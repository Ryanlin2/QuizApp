//
//  WelcomeView.swift
//  QuizzApp
//
//  Created by Ryan Lin on 3/17/25.
//
import SwiftUI
struct WelcomeView: View {
    @Binding var quizStarted:Bool
    private func start(){
        quizStarted = true
        print("Start Quiz")
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to the iOS Quiz!")
                .font(.largeTitle)
                .padding()
            Spacer()
            
            Text("Test your knowledge of iOS development.")
                .font(.subheadline)
                .padding(.bottom, 20)
            
            Button(action:start){
                Text("Start Quiz")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .navigationTitle("Welcome")
    }
}

