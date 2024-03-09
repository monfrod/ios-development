//
//  Enemy.swift
//  classes and inheritance
//
//  Created by yunus on 22.02.2024.
//

class Enemy{
    var health = 100
    var attackStrenght = 10
    
    init(health: Int = 100, attackStrenght: Int = 10) {
        self.health = health
        self.attackStrenght = attackStrenght
    }
    
    func move(){
        print("Walk forward")
    }
    
    func attack(){
        print("Land a hit, does \(attackStrenght) damage")
    }
}
