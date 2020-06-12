//
//  ButtonAnswer.swift
//  CodaQuizz
//
//  Created by matthieu passerel on 09/10/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import SwiftUI

struct ButtonAnswer: View {
    
    var string: String
    var selection: Int
    @Binding var selected: Int
    
    var body: some View {
        Button(action: {
            self.selected = self.selection
        }) {
            Text(string)
                .frame(width: 150, height: 40, alignment: .center)
                .background(setupColor())
                .cornerRadius(10)
        }
    }
    
    func setupColor() -> Color {
        return (self.selected == self.selection) ? .green : Color(red: 0.9, green: 0.9, blue: 0.9)
    }
}

struct ButtonAnswer_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAnswer(string: "test", selection: 1, selected: .constant(2)).previewLayout(.sizeThatFits)
    }
}
