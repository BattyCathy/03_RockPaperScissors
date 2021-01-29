//
//  ContentView.swift
//  03_RockPaperScissors
//
//  Created by Austin Roach on 1/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var computerMove = Int.random(in: 0 ... 2)
    @State var shouldWin = Bool.random()
    
    @State var playerMove = 0
    
    var possibleMoves = ["Rock", "Paper", "Scissors"]
    
    @State var score = 0
    
   @State var roundsLeft = 10
    
    func winRound() {
        advanceRound()
        self.score += 1

    }
    func advanceRound() {
        self.roundsLeft -= 1
        self.shouldWin = Bool.random()
        self.computerMove = Int.random(in: 0 ... 2)
    }
    func loseRound() {
        advanceRound()    }
    
    func checkMove() {
        if shouldWin == true {
            
            if playerMove == 0 && computerMove == 2 {
                winRound()
            } else if playerMove == 1 && computerMove == 0 {
                winRound()
            } else if playerMove == 2 && computerMove == 1 {
                winRound()
            } else {
                loseRound()
            }
        } else {
            if playerMove == 0 && computerMove == 1 {
                winRound()
            } else if playerMove == 1 && computerMove == 2 {
                winRound()
            } else if playerMove == 2 && computerMove == 0 {
                winRound()
            } else {
                loseRound()
            }
        }
    }
    
    var winText: String {
        if shouldWin == true {
            return "Win against"
        } else {
           return "Lose against"
        }
    }
  
    var body: some View {
        VStack {
            Text("Your Score is \(score)")
            Text("\(winText)")
            Text("\(possibleMoves[computerMove])")
            
            Button(action: {
                    playerMove = 0
                checkMove()
            }, label: {
                Text("Rock")
            })
            Button(action: {
                    playerMove = 1
                checkMove()
            }, label: {
                Text("Paper")
            })
            Button(action: {
                    playerMove = 2
                checkMove()
            }, label: {
                Text("Scissors")
            })
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
