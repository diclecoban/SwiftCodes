//
//  main.swift
//  Calculator
//
//  Created by Dicle Sara Çoban on 25.08.2025.
//

import Foundation

menu()



func menu() {
    print("---------------------------")
    print("WELCOME TO SARA CALCULATOR")
    print("---------------------------")
    
    while(true) {
        print("Please enter your first number for calculation")
        let number1 = Double(readLine()!)!
        print("Please enter your second number for calculation")
        let number2 = Double(readLine()!)!
        print("Please enter your operand (+, -, *, /, %)")
        let operand = Character(readLine()!)
        
        calculation(number1: number1, number2: number2, operand: operand)
    }
}

func calculation(number1: Double, number2: Double, operand: Character){
    switch operand {
    case "+":
       let result = number1 + number2
        print(result)
    case "-":
       let result = number1 - number2
        print(result)
    case "*":
       let result = number1 * number2
        print(result)
    case "/":
       let result = number1 / number2
        print(result)
    default:
        print("Invalid Operand")
    }
    
    print("Do you want to continue? (y/n)")
    if readLine() == "n" {
        exit(0)
    } else if readLine() == "y" {
        menu()
    } else {
        print("Invalid input")
        exit(0)
    }
}
