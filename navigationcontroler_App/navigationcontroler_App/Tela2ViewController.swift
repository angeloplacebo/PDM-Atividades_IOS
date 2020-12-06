//
//  Tela2ViewController.swift
//  navigationcontroler_App
//
//  Created by Angelo on 06/12/20.
//

import UIKit

class Tela2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tela 2 - View Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Tela 2 - View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Tela 2 - View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("Tela 2 - View Will Dissapear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("Tela 2 - View Did Disappear")
    }
}
