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
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol:String) {
        switch symbol{
        case "π": accumulator = M_PI
        case "√": accumulator = sqrt(accumulator)
        default: break
        }
    
    
    
    }
    
    var result: Double{  //Read-only property with only set
        get{
            return accumulator
        }
    }
    
}