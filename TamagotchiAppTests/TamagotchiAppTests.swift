//
//  TamagotchiAppTests.swift
//  TamagotchiAppTests
//
//  Created by Khemaney, Akshay (SPH) on 22/01/2021.
//

import XCTest
@testable import TamagotchiApp

class TamagotchiAppTests: XCTestCase {

    func testTamagotchiInititialisesWithCorrectAttributes() {
        // arrange
        let tamagotchi = Tamagotchi()
        
        // assert
        XCTAssertEqual(tamagotchi.happyHearts, 5)
        XCTAssertEqual(tamagotchi.hungryHearts, 5)
        XCTAssertEqual(tamagotchi.health, 10)
        XCTAssertEqual(tamagotchi.age, 0)
        XCTAssertEqual(tamagotchi.weight, 5)
        XCTAssertEqual(tamagotchi.discipline, 0)
        XCTAssertEqual(tamagotchi.isIll, false)
    }
    
    func testTamagotchiShowStatsMethodReturnsCorrectString() {
        //arrange
        let tamagtochi = Tamagotchi()
        
        // assert
        XCTAssertEqual(tamagtochi.showStats(),
        """
            Current Tamagotchi Status:
                Happy Hearts: 5
                Hungry Hearts: 5
                Age: 0
                Weight: 5
                Health: Healthy
        """)
    }
    
    func testTamagotchiEatMealMethod() {
        // arrange
        let tamagotchi = Tamagotchi()
        let originalHungryHearts = tamagotchi.hungryHearts
        let originalWeight = tamagotchi.weight
        
        // act
        tamagotchi.eatMeal()
        
        // assert
        XCTAssertEqual(originalHungryHearts-2, tamagotchi.hungryHearts)
        XCTAssertEqual(originalWeight+1, tamagotchi.weight)
    }

}
