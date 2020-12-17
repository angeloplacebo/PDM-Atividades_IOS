//
//  ViewController.swift
//  Pessoas
//
//  Created by Angelo on 15/12/20.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    
    var cadastro: Cadastro?
    var pessoa: Pessoa?
    var editAtIndex: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if editAtIndex != -1 {
            self.tfNome.text = self.pessoa?.nome
            self.tfIdade.text = String(self.pessoa!.idade)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.editAtIndex = -1
    }
    
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text!
        let idade = Int(self.tfIdade.text!)
        
        let pessoa = Pessoa(nome: nome, idade: idade!)
        
        if editAtIndex != -1 {
            self.cadastro?.update(index: editAtIndex!, pessoa: pessoa)
        }else{
            self.cadastro?.add(pessoa: pessoa)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

