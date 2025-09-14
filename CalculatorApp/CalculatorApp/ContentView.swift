//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Dicle Sara Çoban on 4.09.2025.
//

import SwiftUI

enum myKey: String, Hashable {
    case digit, op, fn
}

struct myButton: Hashable {
    let title: String
    let type: myKey
}

func operatorForTitle(_ s: String) -> Operator? {
    switch s {
    case "+": return .add
    case "-": return .subtract
    case "*": return .multiply
    case "/": return .divide
    case "=": return .result
    default:  return nil
    }
}

let keypad: [[myButton]] = [
    [myButton(title: "AC", type: .fn),myButton(title: "+/-", type: .fn), myButton(title: "%", type: .fn), myButton(title: "/", type: .op)],
    [myButton(title: "7", type: .digit),myButton(title: "8", type: .digit), myButton(title: "9", type: .digit), myButton(title: "*", type: .op)],
    [myButton(title: "4", type: .digit),myButton(title: "5", type: .digit), myButton(title: "6", type: .digit),myButton(title: "-", type: .op)],
    [myButton(title: "1", type: .digit),myButton(title: "2", type: .digit), myButton(title: "3", type: .digit),myButton(title: "+", type: .op)],
    [myButton(title: "D", type: .fn),myButton(title: "0", type: .digit),myButton(title: ".", type: .digit),myButton(title: "=", type: .op)]
]

struct KeyButton: View {
    let button: myButton
    let action: (myButton) -> Void
    var body: some View {
        Button {
            action(button)
        } label: {
            Text(button.title)
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .background(myBackgroundColor)
                .foregroundColor(myForegroundColor)
                .cornerRadius(10)
        }
    }
    
    private var myBackgroundColor: Color {
        switch button.type {
            case .digit: return Color.gray
            case .op: return Color.orange
        case .fn: return Color.white
        }
    }
    
    private var myForegroundColor: Color {
        button.type == .op ? .white : .primary
    }
}




struct ContentView: View {
    @State var engine = CalculatorEngine()
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 0.5), count: 4)
    @State private var result: String = "0"
    
    private func handlePress(_ pressed: myButton) {
        switch pressed.type {
        case .digit:
            engine.inputDigit(pressed.title)
            result = engine.displayText()
        case .op:
            if pressed.title == "=" {
                result = engine.displayText()
            } else if let op = operatorForTitle(pressed.title) {
                engine.setOperator(op)
            }
        case .fn:
            // AC, +/- , %, D vs.
            break
        }
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5).ignoresSafeArea()
        
            VStack(spacing:5) {
                HStack {
                    Spacer()
                    Text(result)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.018, brightness: 0.972))
                }
                .padding()
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(keypad, id: \.self) { row in
                        ForEach(row, id: \.self) { button in
                            KeyButton(button: button) { pressed in
                                handlePress(pressed)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
