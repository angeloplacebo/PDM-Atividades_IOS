//
//  TabelaViewController.swift
//  Pessoas
//
//  Created by Angelo on 15/12/20.
//

import UIKit

class TabelaViewController: UITableViewController {

    var cadastro = Cadastro()
    var pessoa: Pessoa?
    var editAtIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cadastro.add(pessoa: Pessoa(nome: "Primeira", idade: 1))
        self.cadastro.add(pessoa: Pessoa(nome: "Segunda", idade: 2))
        self.cadastro.add(pessoa: Pessoa(nome: "Terceira", idade: 3))
        self.cadastro.add(pessoa: Pessoa(nome: "Quarta", idade: 4))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.editAtIndex = -1
        print(self.cadastro.get())
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cadastro.count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        let pessoa = self.cadastro.get(index: indexPath.row)
        
        cell.textLabel?.text = pessoa.nome
        cell.detailTextLabel?.text = String(pessoa.idade)
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.cadastro.del(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        self.cadastro.mov(from: fromIndexPath.row, to: to.row)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pessoa = self.cadastro.get(index: indexPath.row)
        self.editAtIndex = indexPath.row
        performSegue(withIdentifier: "tabela_form", sender: pessoa)
        
//        let janela = UIAlertController(title: "Atenção", message: pessoa.description, preferredStyle: UIAlertController.Style.alert)
//        janela.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
//        self.present(janela, animated: true, completion: nil)
        
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tabela_form" {
            let fvc = segue.destination as! FormViewController
            fvc.cadastro = self.cadastro
            fvc.pessoa = self.pessoa
            fvc.editAtIndex = self.editAtIndex
        }
    }

}
