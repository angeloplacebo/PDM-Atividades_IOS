//
//  game.swift
//  Arroche
//
//  Created by Angelo on 14/11/20.
//

import UIKit

class game: NSObject {
    
    var li: Int
    var ls: Int
    var n: Int
    var status: String
    
    override init() {
        self.li = 1
        self.ls = 100
        self.n = Int.random(in: 2...99)
        self.status = "Jogando"
    }
    
    func description() -> String {
        return "li= \(self.li), n= \(self.n), ls= \(self.ls)"
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
    
    func limites() -> String{
        return "limite inferior \(self.li), limite superior \(self.ls)"
    }
    
    func checkGameStatus() -> Bool{
        self.status == "Jogando" ? true :  false
    }

}
