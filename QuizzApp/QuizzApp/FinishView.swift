//
//  FinishView.swift
//  QuizzApp
//
//  Created by Esteban Linarez  on 3/23/25.
//

import SwiftUI

struct FinishView: View {
    
    var quiz : QuizMaintainer
    
    var body: some View {
        VStack {
            Text("Quizz App")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Quiz Results")
                .fontWeight(.bold)
            
            Text("You selected the wrong answer \(quiz.incorrectScore) times")
            
            if quiz.incorrectScore == 0 {
                Text("You got them all right!")
            }
            else {
                Text("Keep trying!")
            }
            
            Button("try again"){
                quiz.resetQuiz()
            }
            
        }
        
        
    }
}

#Preview {
    FinishView(quiz: QuizMaintainer())
}
