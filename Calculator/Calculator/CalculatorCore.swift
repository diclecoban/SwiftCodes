//
//  main.swift
//  Calculator
//
//  Created by Dicle Sara Çoban on 25.08.2025.
//

import Foundation

var results: [Double] = []
menu()



func menu() {
    print("---------------------------")
    print("WELCOME TO SARA CALCULATOR")
    print("---------------------------")
    
    print("Please make your choice")
    print("1. Calculate",
          "2. See Last Calculations",
          "3. Exit")
    let choice = Int(readLine()!)!
    
    switch choice {
    case 1:
        print("Please enter your first number for calculation")
        let number1 = Double(readLine()!)!
        print("Please enter your second number for calculation")
        let number2 = Double(readLine()!)!
        print("Please enter your operand (+, -, *, /)")
        let operand = Character(readLine()!)
        
        calculation(number1: number1, number2: number2, operand: operand)
    case 2:
        print("Last Calculations:")
        print(results)
        ContinueOrNot()
    case 3:
        exit(0)
    default:
        print("invalid input")
    }
}

func saveResults(result: Double) {
    results.append(result)
}

func ContinueOrNot() {
    print("Do you want to continue? (y/n)")
    let input = readLine()
    if input == "n" {
        results.removeAll()
        exit(0)
    } else if input == "y" {
        menu()
    } else {
        print("Invalid input")
        exit(0)
    }
}

func calculation(number1: Double, number2: Double, operand: Character){
    switch operand {
    case "+":
       let result = number1 + number2
        saveResults(result: result)
        print(result)
    case "-":
       let result = number1 - number2
        saveResults(result: result)
        print(result)
    case "*":
       let result = number1 * number2
        saveResults(result: result)
        print(result)
    case "/":
       let result = number1 / number2
        saveResults(result: result)
        print(result)
    default:
        print("Invalid Operand")
    }
    ContinueOrNot()
}
