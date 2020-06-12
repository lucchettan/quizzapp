//
//  ContentView.swift
//  CodaQuizz
//
//  Created by matthieu passerel on 09/10/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var category = ["Histoire", "Géographie", "Sport"]
    var question = [
        QuestionModel(intitule: "Quel Pharaon a régné le plus longtemps?", answer: 2, a1: "Akhenaton", a2: "Ramses II", a3: "Toutanhkamon", a4: "Khéops"),
        QuestionModel(intitule: "Avec quel pays la France n'a t'elle aucune frontière?", answer: 1, a1: "Angleterre", a2: "Suisse", a3: "Italie", a4: "Brésil"),
        QuestionModel(intitule: "De quel Sport Joe Montana est il une icone?", answer: 2, a1: "Basketball", a2: "Foot US", a3: "Baseball", a4: "Hockey")
    ]
    
    @State var index = 0
    @State var showAction = false
    @State var showAlert = false
    @State var selected = 0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Apprenez en vous amusant avec professeur Albert")
                        .italic()
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    Image("albert")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75 , height: 75, alignment: .center)
                }
                Divider()
                Text("Catégorie: " + category[index])
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding()
                Button(action: {
                    self.showAction.toggle()
                }) {
                    Text("Changer de Catégorie").foregroundColor(.red)
                }
                Divider()
                
                QuestionView(question: question[index], selected: $selected)
                
                Button(action: {
                    self.showAlert.toggle()
                }) {
                    Text("Valider")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color.red)
                    .cornerRadius(20)
                }

                Spacer()
            }
        .navigationBarTitle("CodaQuizz")
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(
                    title: Text(self.setAlertTitle()),
                    message: Text("La bonne réponse était:  " + self.setMessage()),
                    dismissButton: .default(Text("OK"), action: {
                        self.selected = 0
                    }))
            }
            .actionSheet(isPresented: $showAction) { () -> ActionSheet in
                ActionSheet(
                    title: Text("Changer de Catégorie"),
                    message: Text("Sélectionnez votre catégorie"),
                    buttons: self.setButtons()
                )
            }
        }
    }
    
    func setButtons() -> [Alert.Button] {
        var btns = [Alert.Button]()
        for x in (0..<category.count) {
            let btn = Alert.Button.default(Text(self.category[x])) {
                self.index = x
            }
            btns.append(btn)
        }
        btns.append(Alert.Button.cancel())
        return btns
    }
    
    func getQuestion() -> QuestionModel {
        return question[index]
    }
    
    func setAlertTitle() -> String {
        let q = getQuestion()
        let success = (q.answer == selected)
        return success ? "Félicitations" : "Raté"
    }
    
    func setMessage() -> String {
        let q = getQuestion()
        switch q.answer {
        case 1: return q.a1
        case 2: return q.a2
        case 3: return q.a3
        case 4: return q.a4
        default: return ""
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
