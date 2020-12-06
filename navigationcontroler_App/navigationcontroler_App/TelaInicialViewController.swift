//
//  ViewController.swift
//  navigationcontroler_App
//
//  Created by Angelo on 06/12/20.
//

import UIKit

class TelaInicialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tela Inicial - View Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Tela Inicial - View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Tela Inicial - View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("Tela Inicial - View Will Dissapear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("Tela Inicial - View Did Disappear")
    }

}

