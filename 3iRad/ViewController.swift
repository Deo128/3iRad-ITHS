//
//  ViewController.swift
//  3iRad
//
//  Created by Dejan Hotic on 2020-12-15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var p1Label: UILabel!
    
    @IBOutlet weak var p2Label: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var currentPlayer = 1 // Variable that keeps track of which players turn it is.
    var p1Score = 0 // Cross, variables that keep track of the players scores.
    var p2Score = 0 // Nought, same as the one above.
    var turnCount = 0 // Keeps track of the current turn. If this reaches 9 and no one has won
    // then its a draw.
    
    var gameBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]//Each zero represents a button on the gameboard.
    // everytime player 1 places a cross the 0 will be replaced with a 1 and every time
    // player 2 places a nought the zero will be changed with a 2.
    
    let winningCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    // Each bracket represents a winning combination. For exmple the first bracket with a 0, 1, 2
    // is a winning combination. If player 1 places a cross on number 0, 1 and 2 on the field
    // it means that player 1 has won.
    
    var isActive: Bool = true // Bool that keep track if the game is over or not.
    
    
    
    @IBAction func actionButton(_ action: AnyObject) {
        isActive = true
        
        // Every time a player presses a tile on the board we have to check if there is a 0 in
        // that spot. ONLY WHEN there is a 0 on the pressed tile are we allowed to move on.
        // This is to prevent the players from putting crosses and noughts on the same spot.
        if (gameBoard[action.tag-1] == 0 && isActive == true) {
            gameBoard[action.tag-1] = currentPlayer
            turnCount+=1
            if (currentPlayer == 1 && isActive == true) {
                turnLabel.text = "Player2's turn!"
                action.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                currentPlayer = 2
            
            }else {
                turnLabel.text = "Plyayer1's turn!"
                action.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                currentPlayer = 1
            }
            
            for combinations in winningCombination {
                
                //To determine if we have a winner we must loop through each array in winning-
                //combinations. For example 3, 4, 5 is a winning combinatiom. So if 3, 4, and 5
                // are equal to 1 or 2 that means we have a winner. We are basically comparing each..
                //combination to the gameboard. If none of the combinations is equal to 1 or 2
                // on the gameBoard then that means that it's a draw.
                
                if (gameBoard[combinations[0]] != 0 && gameBoard[combinations[0]] == gameBoard[combinations[1]] && gameBoard[combinations[1]] == gameBoard[combinations[2]]) {
                    
                    isActive = false
                    
                    if (gameBoard[combinations[0]] == 1 && isActive == false) {
                        
                        resultLabel.text = "Player1 has won!!!"
                        p1Score+=1
                        p1Label.text = "Player1's score:" + String(p1Score)
                        
                        // Every button has a tag from 1-9. We loop through every button
                        // and we disable the buttons everytime someone wins or when we have a draw.
                        
                        for i in 1...9 {
                            
                            let button = view.viewWithTag(i) as? UIButton
                            button?.isEnabled = false
                        }
                        
                    }else if(gameBoard[combinations[0]] == 2 && isActive == false){
                        resultLabel.text = "Player 2 has won!!!"
                        p2Score+=1
                        p2Label.text = "Player 2's score:" + String(p2Score)
                        
                        for i in 1...9 {
                            
                            let button = view.viewWithTag(i) as? UIButton
                            button?.isEnabled = false
                        }
                }
        }
            if(turnCount == 9 && isActive == true){
                isActive = false
                resultLabel.text = "It's a draw!"
                if (isActive == false) {
                    for i in 1...9 {
                        
                        let button = view.viewWithTag(i) as? UIButton
                        button?.isEnabled = false
                    }
                }
            }
    }
  }
}
    @IBOutlet weak var newGameButton: UIBarButtonItem!
    
    // Every time we press the new game button we need to reset everything to its
    // original value.
    @IBAction func newGame(_ sender: Any) {
        turnLabel.text = "Player1's turn!"
        gameBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        currentPlayer = 1
        turnCount = 0
        resultLabel.text = ""
        
        // Loop through each pictureTag and set it to a button and then resets the button image.
        for i in 1...9 {
            if let button = (view.viewWithTag(i) as? UIButton) {
                
                button.setImage(nil, for: UIControl.State())
                button.isEnabled = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}




