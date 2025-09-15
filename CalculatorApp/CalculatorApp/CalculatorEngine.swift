//
//  CalculatorEngine.swift
//  CalculatorApp
//
//  Created by Dicle Sara Çoban on 13.09.2025.
//

enum Operator {
    case add
    case multiply
    case subtract
    case divide
    case result
}

struct CalculatorEngine {
    var pendingOperator: Operator? = nil
    var currentOperand: Double = 0
    var previousOperand: Double? = nil
    var isOperatorActive: Bool = false
    
    mutating func inputDigit(_ digit: String) {
        currentOperand = Double(digit) ?? 0
        if isOperatorActive {
            isOperatorActive = false
        }
    }
    
    mutating func isActive() -> Bool {
        return isOperatorActive
    }
    
    mutating func setOperator(_ op: Operator) {
        pendingOperator = op
        previousOperand = currentOperand
        currentOperand = 0
        isOperatorActive = false
    }
    
    mutating func calculateEquals() -> Double {
        return currentOperand
    }
    
    mutating func reSign(){
        currentOperand *= -1
    }
    
    mutating func clear() {
        currentOperand = 0
        previousOperand = nil
        pendingOperator = nil
        isOperatorActive = false
    }
    
    mutating func calculateResult(){
        isOperatorActive = true
        switch pendingOperator {
            case .add:
            currentOperand = previousOperand! + currentOperand
        case .multiply:
            currentOperand =  previousOperand! * currentOperand
        case .subtract:
            currentOperand =  previousOperand! - currentOperand
        case .divide:
            currentOperand =  previousOperand! / currentOperand
        default:
            break
        }
    }
}
