//
//  ViewController.swift
//  Calculator
//
//  Created by Stephen Shaw on 4/27/17.
//  Copyright © 2017 sshaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            print("textCurrentlyInDisplay: \(textCurrentlyInDisplay)")
            if !(display.text!.contains(".") && digit == ".") {
              display.text = textCurrentlyInDisplay + digit
            } else {
                return
            }
            print("display.text \(display.text!)")
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
            
        }
        if let result = brain.result  {
            displayValue = result
        }
    }
    
}

