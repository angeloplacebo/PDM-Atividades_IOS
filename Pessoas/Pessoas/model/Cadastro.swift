//
//  Cadastro.swift
//  Pessoas
//
//  Created by Angelo on 15/12/20.
//

import Foundation

class Cadastro{
    var lista: Array<Pessoa>
    
    init() {
        self.lista = Array()
    }
    
    func add(pessoa: Pessoa){
        self.lista.append(pessoa)
    }
    
    func count() -> Int{
        return self.lista.count
    }
    
    func get() -> Array<Pessoa>{
        return self.lista
    }
    
    func get(index: Int) -> Pessoa{
        return self.lista[index]
    }
    
    func del(index: Int){
        self.lista.remove(at: index)
    }
    
    func mov(from: Int, to: Int){
        let pessoa = self.lista[from]
        self.lista.remove(at: from)
        self.lista.insert(pessoa, at: to)
    }
    
    func update(index: Int, pessoa: Pessoa){
        self.lista[index] = pessoa
    }
}
