//
//  TicTacToeImageView.swift
//  3iRad
//
//  Created by Dejan Hotic on 2021-01-12.
//

import UIKit

class TicTacToeImageView: UIImageView {

    var player : String?
    var activated : Bool = false
    
    func setPlayer (_player: String?) {
        player = _player
        
        if activated == false {
            if _player == "x" {
                image = UIImage(named: "Cross.png")
            }else {
                image = UIImage(named: "Nought.png")
            }
            activated = true
        }
        
    }

}
