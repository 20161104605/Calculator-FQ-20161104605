//  CalculatorViewController.swift
//  Calculator
//  Created by FuQiang  on 2018/11/14.
//  Copyright © 2018年 FuQiang. All rights reserved. V3.0
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var displayVlaueOutlet: UILabel!
    var displayValue: Double {
        get {
            return Double(displayVlaueOutlet.text!)!
        }
        set {
            if Double(Int(newValue)) == newValue {
                displayVlaueOutlet.text = String(Int(newValue))
            }else {
                displayVlaueOutlet.text = String(newValue)
            }
        }
    }
    var brain = CalcuatorBrain()
    var userIsInTyping: Bool = false
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let textCurrentInDisplay = displayVlaueOutlet.text!
        // 记录状态,(输入状态)
        if userIsInTyping {
            if digit == "0" && textCurrentInDisplay == "0" {
                displayVlaueOutlet.text = "0"
            }
            else {
                displayVlaueOutlet.text = textCurrentInDisplay + digit
            }
        }
        else {
            if digit == "." {
                displayVlaueOutlet.text = "0."
            }else {
                displayVlaueOutlet.text = digit
            }
            userIsInTyping = true
        }
    }
    @IBAction func performOperation(_ sender: UIButton) {
        // 1. 设置操作数
        if userIsInTyping {
            brain.setOperand(displayValue)
            // 设置完错作符之后，需要接受第二个操作数
            userIsInTyping = false
        }
        // 2.执行计算
        brain.performOperation(sender.currentTitle!)
        // 3.获取结果
        if let result = brain.result {
            displayValue = result
        }
    }
}
extension CalculatorViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


