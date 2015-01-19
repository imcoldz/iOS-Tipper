//
//  ViewController.swift
//  Tipper
//
//  Created by Xiangyu Zhang on 1/17/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLael: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLael.text = "$0.00"
        totalLabel.text = "$0.00"
        
        self.view.backgroundColor = UIColor.blueColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipPercentageChangedAction(sender: AnyObject) {
        //println("User changing percentage selection")
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLael.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLael.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //chaning background color according to the tip percentage
        if tipControl.selectedSegmentIndex == 0 {
            self.view.backgroundColor = UIColor.blueColor()
        }
        if tipControl.selectedSegmentIndex == 1 {
            self.view.backgroundColor = UIColor.yellowColor()
        }
        if tipControl.selectedSegmentIndex == 2 {
            self.view.backgroundColor = UIColor.redColor()
        }
    }
   
    @IBAction func onEditingChanged(sender: AnyObject) {
        //println("User editing bill")
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLael.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLael.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

