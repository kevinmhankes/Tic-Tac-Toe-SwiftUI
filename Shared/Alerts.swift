//
//  Alerts.swift
//  Tic-Tac_Toe
//
//  Created by Kevin Hankes on 2/5/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win!"),
                             message: Text("You're so good! You beat your own AI!"),
                             buttonTitle: Text("Nice!"))
    
    static let computerWin = AlertItem(title: Text("You Lost!"),
                                message: Text("Your AI is too strong!"),
                                buttonTitle: Text("What Have I Done?"))
    
    static let draw = AlertItem(title: Text("Draw"),
                         message: Text("Looks like we have some equal intellects here!"),
                         buttonTitle: Text("Interesting!"))
}
