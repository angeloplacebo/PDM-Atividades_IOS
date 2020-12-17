//
//  ViewController.swift
//  Pessoas 2
//
//  Created by Angelo on 17/12/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    var delegate: AppDelegate!
    var contexto: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = UIApplication.shared.delegate as? AppDelegate
        self.contexto = self.delegate.persistentContainer.viewContext
    }
    
    @IBAction func updateIdades(_ sender: Any) {
        self.increseIdade()
    }
    
    @IBAction func updateNames(_ sender: Any) {
        self.namesToUpper()
    }
    
    @IBAction func remove(_ sender: Any) {
        self.delAll()
    }
    
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text
        let idade = Int(self.tfIdade.text!)
        let pessoa = NSEntityDescription.insertNewObject(forEntityName: "Pessoa", into: self.contexto)
        
        pessoa.setValue(nome, forKey: "nome")
        pessoa.setValue(idade, forKey: "idade")
        
        self.delegate.saveContext()
        self.listar()
    }
    
    func listar(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        
        do {
            let pessoas = try self.contexto.fetch(requisicao) as!  [NSManagedObject]
            for p in pessoas{
                let nome = p.value(forKey: "nome")
                let idade = p.value(forKey: "idade")
                print("\(nome!) - \(idade!)")
            }
        } catch {
            print("Erro!")
        }
        
    }
    
    func increseIdade(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        do {
            let pessoas = try self.contexto.fetch(requisicao) as! [NSManagedObject]
            for p in pessoas{
                let idade = p.value(forKey: "idade") as! Int
                p.setValue(idade+1, forKey: "idade")
            }
            self.delegate.saveContext()
            print("Idades Updated!")
            self.listar()
        }catch{
            print("erro!")
        }
    }
    func namesToUpper(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        do {
            let pessoas = try self.contexto.fetch(requisicao) as! [NSManagedObject]
            for p in pessoas{
                let nome = p.value(forKey: "nome") as! String
                p.setValue(nome.uppercased(), forKey: "nome")
            }
            self.delegate.saveContext()
            print("Names Uppercased!")
            self.listar()
            
        }catch{
            print("erro!")
        }
    }
    func delAll(){
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        do {
            let pessoas = try self.contexto.fetch(requisicao) as! [NSManagedObject]
            for p in pessoas{
                self.contexto.delete(p)
            }
            self.delegate.saveContext()
            print("All Deleted!")
            self.listar()
        }catch{
            print("erro!")
        }
    }
    
}
