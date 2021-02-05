//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Khemaney, Akshay (SPH) on 22/01/2021.
//

import Foundation

class Tamagotchi: ObservableObject {
    @Published var happyHearts: Int = 2 {
        didSet {
            if happyHearts > 4 {
                happyHearts = 4
            } else if happyHearts < 0 {
                happyHearts = 0
            }
        }
    }
    @Published var hungryHearts: Int = 5 {
        didSet {
            if hungryHearts > 10 {
                hungryHearts = 10
            } else if hungryHearts < 0 {
                hungryHearts = 0
            }
        }
    }
//    var health: Int = 10 {
//        didSet {
//            if health > 10 {
//                health = 10
//            } else if health < 0 {
//                health = 0
//            }
//        }
//    }
    var dead: Bool = false
    @Published var age: Int = 0
    @Published var weight: Int = 5 {
        didSet {
            if weight > 10 {
                weight = 10
            } else if weight < 0 {
                weight = 0
            }
        }
    }
    @Published var needsCleaning: Bool = false
    @Published var isIll: Bool = false
    
    func eatSnack() {
        happyHearts += 1
        weight += 2
    }
    
    func eatMeal() {
        hungryHearts -= 2
        weight += 1
    }
    
    func playGame() {
        happyHearts += 1
        weight -= 1
    }
    
    func cleanUp() {
        needsCleaning = false
    }
    
    func takeMedicine() {
        if isIll {
            isIll = false
        }
    }
    
    func checkDead() -> Bool {
        if weight <= 0 || weight >= 10 {
            return true
        }
        if age >= 15 {
            return true
        }
        if hungryHearts >= 10 {
            return true
        }
        if happyHearts <= 0 {
            return true
        }
        if dead {
            return true
        }
        
        return false
    }
    
    func showStats() -> String {
        if checkDead() {
            return
        """
            Current Tamagotchi Status:
                Happy Hearts: DEAD
                Hungry Hearts: DEAD
                Age: DEAD
                Weight: DEAD
                Health: DEAD
        """
        }
        
        var health = "Healthy"
        var hygeine = "Clean"
        if isIll {
            health = "Ill"
        }
        if needsCleaning {
            hygeine = "Needs Cleaning"
        }
        
        let stats = """
            Current Tamagotchi Status:
                Happy Hearts: \(happyHearts)
                Hungry Hearts: \(hungryHearts)
                Age: \(age)
                Weight: \(weight)
                \(hygeine)
                \(health)
        """
        
        return stats
        
    }
    
    func photo() -> String {
        if checkDead() {
            return "DeadEmoji"
        }
        if isIll {
            return "SickEmoji"
        }
        if happyHearts <= 1 {
            return "SadEmoji"
        }
        if hungryHearts >= 8 {
            return "HungryEmoji"
        }
        
        return "HappyEmoji"
    }
}

