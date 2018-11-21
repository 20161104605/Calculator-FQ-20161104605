//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by FuQiang  on 2018/11/14.
//  Copyright © 2018年 FuQiang. All rights reserved.
//
import UIKit

class DigitButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //layer.cornerRadius = bounds.size.height * 0.5
        layer.masksToBounds = true
    }

}
