//
//  main.swift
//  arroche_o_numero
//
//  Created by Angelo on 05/11/20.
//

import Foundation

class game{
    var li = 1
    var ls = 100
    var n = Int.random(in: 2...99)
    var status = "Jogando"
    
    func description() {
        print("li=\(self.li), n=\(self.n), ls=\(self.ls), status=\(self.status)")
    }
    
    func getUserEntry() -> Int {
        print("insira um numero:")
        if let chute = Int(readLine()!){
            return chute
        }else{
            return -1
        }
    }
    
    func chutar(chute:Int){
        
        if chute == n || chute == li || chute == ls || chute > ls || chute < li {
            self.status = "Perdeu"
            
        }else{
            self.li = chute < n ? chute : self.li
            self.ls = chute > n ? chute : self.ls
            
        }
        
        if li == n-1 && ls == n+1 {
            self.status = "Ganhou"
        }
    }
    
    func checkGameStatus() -> Bool{
        self.status == "Jogando" ? true :  false
    }
}


var jogo = game()

while jogo.checkGameStatus(){
    jogo.description()
    let n_chutado = jogo.getUserEntry()
    
    if n_chutado != -1 {
        jogo.chutar(chute:n_chutado)
    }
}

print(jogo.status)


