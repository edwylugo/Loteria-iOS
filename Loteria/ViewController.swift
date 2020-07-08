//
//  ViewController.swift
//  Loteria
//
//  Created by EPR Exatron on 01/08/2018.
//  Copyright © 2018 Exatron. All rights reserved.
//

import UIKit

enum GameType: String {
    case megasena = "Mega-sena"
    case quina = "Quina"
    case lotofacil = "Lotofácil"
}

infix operator >-<
func >-< (total: Int, universe: Int) -> [Int]{
    var result: [Int] = []
    
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber){
            result.append(randomNumber)
        }
    }
    return result.sorted()
}

class ViewController: UIViewController {

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!

    @IBOutlet weak var ball1: UIButton!
    @IBOutlet weak var ball2: UIButton!
    @IBOutlet weak var ball3: UIButton!
    @IBOutlet weak var ball4: UIButton!
    @IBOutlet weak var ball5: UIButton!
    @IBOutlet weak var ball6: UIButton!
    @IBOutlet weak var ball7: UIButton!
    @IBOutlet weak var ball8: UIButton!
    @IBOutlet weak var ball9: UIButton!
    @IBOutlet weak var ball10: UIButton!
    @IBOutlet weak var ball11: UIButton!
    @IBOutlet weak var ball12: UIButton!
    @IBOutlet weak var ball13: UIButton!
    @IBOutlet weak var ball14: UIButton!
    @IBOutlet weak var ball15: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
        
     
    }

    func showNumbers(for type: GameType) {
        lbGameType.text = type.rawValue
        var game: [Int] = []
        
        switch type {
            case .megasena:
                game = 6>-<60
                ball1.isHidden = false
                ball2.isHidden = false
                ball3.isHidden = false
                ball4.isHidden = false
                ball5.isHidden = false
                ball6.isHidden = false
                ball7.isHidden = true
                ball8.isHidden = true
                ball9.isHidden = true
                ball10.isHidden = true
                ball11.isHidden = true
                ball12.isHidden = true
                ball13.isHidden = true
                ball14.isHidden = true
                ball15.isHidden = true
                print("Megasena: \(game)")
            
        case .quina:
                game = 5>-<80
                
                ball1.isHidden = false
                ball2.isHidden = false
                ball3.isHidden = false
                ball4.isHidden = false
                ball5.isHidden = false
                ball6.isHidden = true
                ball7.isHidden = true
                ball8.isHidden = true
                ball9.isHidden = true
                ball10.isHidden = true
                ball11.isHidden = true
                ball12.isHidden = true
                ball13.isHidden = true
                ball14.isHidden = true
                ball15.isHidden = true
                print("Quina: \(game)")
        
                
            
            case .lotofacil:
                game = 15>-<25
                ball1.isHidden = false
                ball2.isHidden = false
                ball3.isHidden = false
                ball4.isHidden = false
                ball5.isHidden = false
                ball6.isHidden = false
                ball7.isHidden = false
                ball8.isHidden = false
                ball9.isHidden = false
                ball10.isHidden = false
                ball11.isHidden = false
                ball12.isHidden = false
                ball13.isHidden = false
                ball14.isHidden = false
                ball15.isHidden = false
                print("Lotofácil: \(game)")
            
        }
        
        for (index, game) in game.enumerated(){
            balls[index].setTitle("\(game)", for: .normal)
        }
        
    }

    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        case 1:
            showNumbers(for: .quina)
        case 2:
            showNumbers(for: .lotofacil)
        default:
            showNumbers(for: .lotofacil)
        }
    }
    
}

