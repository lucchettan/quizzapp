//
//  ContentView.swift
//  QuizzApp
//
//  Created by Nicolas Lucchetta on 15/11/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var index = 0
    @State var selected = 0

    var categories = ["Histoire", "Culture", "Sport"]
    var questions = [QuestionModel(intitule: "Quel Pharaon a régné le plus longtemps?", answer: 2, a1: "Akhenaton", a2: "Ramses II", a3: "Toutanhkamon", a4: "Khéops"), QuestionModel(intitule: "Avec quel pays la France n'a t'elle aucune frontière?", answer: 1, a1: "Angleterre", a2: "Suisse", a3: "Italie", a4: "Brésil"), QuestionModel(intitule: "De quel Sport Joe Montana est il une icone?", answer: 2, a1: "Basketball", a2: "Foot US", a3: "Baseball", a4: "Hockey")]
    
    @State var showAlert = false
    @State var showAction = false

    var body: some View {
        VStack {
            HStack {
                Text(String("CodaQuizz"))
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
                .edgesIgnoringSafeArea(.all)
            HStack {
                Text("Apprenez en vous amusant avec Albert")
                    .multilineTextAlignment(.center)
                    .frame(width: CGFloat(200))
                Image("albert")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: CGFloat(120), height: CGFloat(180))
                    .clipped()
            }
                .frame(height: 200)
                .offset(y: -50)
            Divider()
            Text("Catégorie: " + String(categories[index]))
                .font(.largeTitle)
                .italic()
                .foregroundColor(Color.blue)
            Button(action: { self.showAction = true } ){
                Text(String("Changer de catégorie"))
                    .foregroundColor(Color.red)
            }
                .padding(20)
            Divider()
                
            
            QuestionsView(question: questions[index], selected: $selected)


            Button(action: { self.showAlert = true } ){
                Text(String("Valider"))
                    .font(.largeTitle).foregroundColor(Color.red).bold()
            }
            
            
        }
            .actionSheet(isPresented: $showAction) { () -> ActionSheet in
                ActionSheet(title: Text("Catégorie"), message: Text("Séléctionnez une catégorie"),
                        buttons: [
                            .default(Text("Histoire"), action: { self.index = 0}),
                            .default(Text("Culture"), action: { self.index = 1}),
                            .default(Text("Sport"), action: { self.index = 2})
                ])}
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(
                    title: Text(questions[index].answer == selected ? "Bravo!" : "Eeeeh non!"),
                    dismissButton: .default(Text("Continuer"), action: { self.selected = 0 }
                    ))}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
