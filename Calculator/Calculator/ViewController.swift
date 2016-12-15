//
//  ViewController.swift
//  Calculator
//
//  Created by Danny McMurrough on 12/13/16.
//  Copyright © 2016 DanBamboo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!  //implicitly unwraps automatically
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }


    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle{
            if mathematicalSymbol == "π"{
                display.text = String (M_PI)
        }
    }
}
}