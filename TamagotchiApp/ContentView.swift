//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Khemaney, Akshay (SPH) on 22/01/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi()
    @State private var timePassed = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Form {
            Text("\(tamagotchi.showStats())")
                .onReceive(timer) { _ in
                    timePassed += 1
                    if timePassed % 30 == 0 {
                        tamagotchi.age += 1
                        tamagotchi.happyHearts -= 1
                    } else if timePassed % 15 == 0 {
                        if tamagotchi.isIll {
                            tamagotchi.dead = true
                        }
                        if tamagotchi.needsCleaning {
                            tamagotchi.isIll = true
                            tamagotchi.needsCleaning = false
                        }
                        tamagotchi.hungryHearts += 1
                        tamagotchi.weight -= 1
                        if Int.random(in: 1...3) == 3 {
                            tamagotchi.needsCleaning = true
                        }
                    }
                }
            Button("Feed Meal", action: {
                tamagotchi.eatMeal()
            })
            Button("Feed Snack", action: {
                tamagotchi.eatSnack()
            })
            Button("Play Game", action: {
                tamagotchi.playGame()
            })
            Button("Clean Up", action: {
                tamagotchi.cleanUp()
            })
            .disabled(!tamagotchi.needsCleaning)
            Button("Give Medicine", action: {
                tamagotchi.takeMedicine()
            })
            .disabled(!tamagotchi.isIll)
            Image(tamagotchi.photo())
                .resizable()
                .scaledToFit()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
