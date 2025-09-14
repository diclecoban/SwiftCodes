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
    
    mutating func inputDigit(_ digit: String) {
        currentOperand = Double(digit) ?? 0
    }
    
    mutating func setOperator(_ op: Operator) {
        pendingOperator = op
        previousOperand = currentOperand
        currentOperand = 0
    }
    
    mutating func calculateEquals() -> Double {
        return calculateResult()
    }
    
    mutating func displayText() -> String {
        return "\(currentOperand)"
    }
    
    mutating func calculateResult() -> Double {
        switch pendingOperator {
            case .add:
            return previousOperand! + currentOperand
        case .multiply:
            return previousOperand! * currentOperand
        case .subtract:
            return previousOperand! - currentOperand
        case .divide:
            return previousOperand! / currentOperand
        case .result:
            fallthrough
        default:
            break
        }
        return 0
    }
}
