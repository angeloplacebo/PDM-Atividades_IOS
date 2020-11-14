//
//  ViewController.swift
//  Arroche
//
//  Created by Angelo on 13/11/20.
//

import UIKit

class MainViewController: UIViewController {
    
    var jogo = game()
    
    @IBOutlet weak var btChutar: UIButton!
    @IBOutlet weak var tfChute: UITextField!
    @IBOutlet weak var lbLimites: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self.jogo.description())")
        btChutar.layer.cornerRadius = 30.0
    }


    @IBAction func Chutar(_ sender: Any) {
        if jogo.checkGameStatus(){
            if let n = Int(self.tfChute.text!){
                jogo.chutar(chute: n)
                self.lbLimites.text = jogo.limites()
                let rsvc = self.storyboard?.instantiateViewController(identifier: "ResultScreen") as! ResultViewController
                
                switch jogo.status {
                case "Ganhou":
                    rsvc.message = "Ganhou"
                    self.btChutar.isEnabled = false
                    self.present(rsvc, animated: true, completion: nil)
                    
                case "Perdeu":
                    rsvc.message = "Perdeu"
                    self.btChutar.isEnabled = false
                    self.present(rsvc, animated: true, completion: nil)
                    
                default:
                    print("\(jogo.description())")
                }
            }
        }else{
            self.btChutar.isEnabled = false
        }
        
    }
    
    
    @IBAction func NewGame(_ sender: Any) {
        self.jogo = game()
        print("\(self.jogo.description())")
        self.lbLimites.text = jogo.limites()
        self.btChutar.isEnabled = true
    }
}
