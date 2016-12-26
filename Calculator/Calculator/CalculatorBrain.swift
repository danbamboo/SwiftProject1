//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Danny McMurrough on 12/17/16.
//  Copyright © 2016 DanBamboo. All rights reserved.
//

import Foundation


class CalculatorBrain{
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {  //setting function assignes accumulator
        accumulator = operand
    }
    //Dictonary of type String -- Operation (enum)
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "Ac" : Operation.Constant(0),
        "√" : Operation.UnaryOperation(sqrt), //pass function w/ unary type
        "cos" : Operation.UnaryOperation(cos), //cos
        "(-)" : Operation.UnaryOperation({$0 * -1}),
        "x²" : Operation.UnaryOperation({$0 * $0}),
        "Log" : Operation.UnaryOperation(log10),
        "×" : Operation.BinaryOperation({ $0 * $1 }),  //Closure example using type inference and default variables
        "÷" : Operation.BinaryOperation({ $0 / $1} ),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "−" : Operation.BinaryOperation({ $0 - $1 }),
        "=" : Operation.Equals
        
    ]
    
    private enum Operation{  //Enum to represent types of operations used by dictionary
        case Constant(Double)  //associated value
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol:String) {
        if let operation = operations[symbol]{
            switch operation{
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction:function, firstOperand : accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    
    }
    
    private func executePendingBinaryOperation()
    {
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil  //assign back to nil because should be reset after assigning.
        }
    }
    
    private var pending: PendingBinaryOperationInfo?  //struct instance assigned as optional
    
    private struct PendingBinaryOperationInfo{
        var binaryFunction: (Double,Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double{  //Read-only property with only set
        get{
            return accumulator
        }
    }
    
}