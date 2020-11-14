//
//  ResultViewControler.swift
//  Arroche
//
//  Created by Angelo on 13/11/20.
//

import UIKit

class ResultViewController : UIViewController {
    
    var message: String?
    
    @IBOutlet weak var btNewGame: UIButton!
    @IBOutlet weak var lbMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch message {
        
        case "Ganhou":
            self.lbMessage.text = "Você Ganhou, Parabéns"
            self.view.backgroundColor = UIColor.systemGreen
            self.btNewGame.setTitleColor( UIColor.systemGreen, for: .normal)
            
        case "Perdeu":
            self.lbMessage.text = "Você Perdeu, :("
            self.view.backgroundColor = UIColor.red
            self.btNewGame.setTitleColor( UIColor.red, for: .normal)
            
        default:
            break
        }
        
        self.btNewGame.layer.cornerRadius = 30.0
        self.btNewGame.tintColor = UIColor.white
    }
    
    @IBAction func Voltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
