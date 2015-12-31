//
//  ViewController.swift
//  tips
//
//  Created by Harshil Maskai on 12/23/15.
//  Copyright (c) 2015 Harshil Maskai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet var tipView: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var share1Label: UILabel!
    @IBOutlet weak var share2Label: UILabel!
    @IBOutlet weak var share3Label: UILabel!
    @IBOutlet weak var share4Label: UILabel!
    @IBOutlet weak var newTotalLabel: UILabel!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        peopleTextField.text = "1"
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(0, forKey: "default_tip")
        defaults.setValue("10", forKey: "Segment1")
        defaults.setValue("15", forKey: "Segment2")
        defaults.setValue("20", forKey: "Segment3")
        defaults.setValue(billTextField.text, forKey: "BillAmount")
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
                   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  


    @IBAction func billEditingChanged(sender: AnyObject) {

       var tipPercentage = ((tipControl.titleForSegmentAtIndex(tipControl.selectedSegmentIndex)!.componentsSeparatedByString("%")[0]as NSString).doubleValue)/100
        
        var billAmount =  NSString(string: billTextField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if peopleTextField.text==""
        {
            shareLabel.text = " - "
        }
        else
        {
            var temp = total/(peopleTextField.text! as NSString).doubleValue
            shareLabel.text = String(format: "$%.2f", temp)
        }
        newTotalLabel.text = String(format: "$%.2f", total)
        share1Label.text = String(format: "$%.2f", total)
        share2Label.text = String(format: "$%.2f", total/2.0)
        share3Label.text = String(format: "$%.2f", total/3.0)
        share4Label.text = String(format: "$%.2f", total/4.0)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        billTextField.becomeFirstResponder()
        
    }
  
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
        let defaults = NSUserDefaults.standardUserDefaults()
        // let tipValue = defaults.doubleForKey("default_tip")
        let tipValue = defaults.integerForKey("default_tip")
        tipControl.selectedSegmentIndex = tipValue
        tipControl.setTitle(defaults.stringForKey("Segment1")!+"%", forSegmentAtIndex: 0)
        tipControl.setTitle(defaults.stringForKey("Segment2")!+"%", forSegmentAtIndex: 1)
        tipControl.setTitle(defaults.stringForKey("Segment3")!+"%", forSegmentAtIndex: 2)
        billEditingChanged(self)
    }
    
    @IBAction func viewSplitButton(sender: UIButton) {
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.view1.alpha = 0
            self.view2.alpha = 0
            self.view3.alpha = 1
        })
        peopleTextField.becomeFirstResponder()
    }
    @IBAction func returnButton(sender: UIButton) {
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.view1.alpha = 1
            self.view2.alpha = 1
            self.view3.alpha = 0
        })
        
        billTextField.becomeFirstResponder()
    }

}

