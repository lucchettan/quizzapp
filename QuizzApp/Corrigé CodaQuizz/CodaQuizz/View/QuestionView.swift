//
//  QuestionView.swift
//  CodaQuizz
//
//  Created by matthieu passerel on 09/10/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    
    var question: QuestionModel
    @Binding var selected: Int
    
    var body: some View {
        VStack {
            Text(question.intitule)
            HStack {
                ButtonAnswer(string: question.a1, selection: 1, selected: $selected)
                Spacer()
                ButtonAnswer(string: question.a2, selection: 2, selected: $selected)
            }.padding()
            HStack {
                ButtonAnswer(string: question.a3, selection: 3, selected: $selected)
                Spacer()
                ButtonAnswer(string: question.a4, selection: 4, selected: $selected)
            }.padding()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: QuestionModel(intitule: "De quel Sport Joe Montana est il une icone?", answer: 2, a1: "Basketball", a2: "Foot US", a3: "Baseball", a4: "Hockey"), selected: .constant(2))
    }
}
