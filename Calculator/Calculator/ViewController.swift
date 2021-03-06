//
//  ViewController.swift
//  Calculator
//
//  Created by Danny McMurrough on 12/13/16.
//  Copyright © 2016 DanBamboo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!  //implicitly unwraps automatically
    
    private var userIsInTheMiddleOfTyping = false
    private var currentFloat = false
    
    //action for number buttons
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if digit == "."{
            if currentFloat{
                return
            }
            else{
                currentFloat = true
            }
        }
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }

    private var displayValue: Double{   //Used to track all the doubles made from operations
        //Called a computed property.
        get{
           return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    //Action for the function buttons, including equal
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
            currentFloat = false
        }
        
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(mathematicalSymbol)
        }
        
        displayValue = brain.result
    }
 
    
    
}