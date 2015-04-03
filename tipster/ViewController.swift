//
//  ViewController.swift
//  tipster
//
//  Created by Jae Hoon Lee on 1/31/15.
//  Copyright (c) 2015 Jae Hoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var priceWithoutTax: UILabel!
    
    @IBOutlet weak var tenPercentTipTotal: UILabel!
    @IBOutlet weak var fifteenPercentTipTotal: UILabel!
    @IBOutlet weak var twentyPercentTipTotal: UILabel!
    @IBOutlet weak var tenPercentTip: UILabel!
    @IBOutlet weak var fifteenPercentTip: UILabel!
    @IBOutlet weak var twentyPercentTip: UILabel!

    @IBAction func numberPadPressed(sender: UIButton) {
        println(sender.currentTitle!)
        if let buttonPressed = sender.currentTitle {
            if buttonPressed == "c" {
                priceWithoutTax.text = "0"
            } else {
                if let number = sender.currentTitle {
                    if priceWithoutTax.text == "0" {
                        priceWithoutTax.text = number
                    } else {
                        priceWithoutTax.text = priceWithoutTax.text! + number
                    }
                }        
            }
            updateTotal()
            updateTips()
        }
    }
    
    func updateTotal() {
        let valueToCalculate = (priceWithoutTax.text! as NSString).doubleValue
        tenPercentTipTotal.text = String(format:"%.2f", valueToCalculate * 1.1)
        fifteenPercentTipTotal.text = String(format:"%.2f", valueToCalculate * 1.15)
        twentyPercentTipTotal.text = String(format:"%.2f", valueToCalculate * 1.2)
    }
    
    func updateTips() {
        let valueToCalculate = (priceWithoutTax.text! as NSString).doubleValue
        tenPercentTip.text = String(format:"%.2f", (tenPercentTipTotal.text! as NSString).doubleValue - valueToCalculate)
        fifteenPercentTip.text = String(format:"%.2f", (fifteenPercentTipTotal.text! as NSString).doubleValue - valueToCalculate)
        twentyPercentTip.text = String(format:"%.2f", (twentyPercentTipTotal.text! as NSString).doubleValue - valueToCalculate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenPercentTipTotal.text = "0"
        fifteenPercentTipTotal.text = "0"
        twentyPercentTipTotal.text = "0"
        tenPercentTip.text = "0"
        fifteenPercentTip.text = "0"
        twentyPercentTip.text = "0"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

