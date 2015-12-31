//
//  SettingsViewController.swift
//  
//
//  Created by Harshil Maskai on 12/27/15.
//
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var PercentageSegmented: UISegmentedControl!
    
    @IBOutlet weak var PercentageLabel1: UILabel!
    @IBOutlet weak var PercentageLabel2: UILabel!
    @IBOutlet weak var PercentageLabel3: UILabel!
    @IBOutlet weak var Stepper1: UIStepper!
    @IBOutlet weak var Stepper2: UIStepper!
    @IBOutlet weak var Stepper3: UIStepper!
    @IBOutlet weak var saveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ValueChanged(sender: AnyObject) {
        var index = PercentageSegmented.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(index, forKey: "default_tip")
        defaults.synchronize()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("default_tip")
        PercentageSegmented.selectedSegmentIndex = tipValue
        Stepper1.value = defaults.doubleForKey("Segment1")
        Stepper2.value = defaults.doubleForKey("Segment2")
        Stepper3.value = defaults.doubleForKey("Segment3")
        PercentageSegmented.setTitle(defaults.stringForKey("Segment1")!+"%", forSegmentAtIndex: 0)
        PercentageSegmented.setTitle(defaults.stringForKey("Segment2")!+"%", forSegmentAtIndex: 1)
        PercentageSegmented.setTitle(defaults.stringForKey("Segment3")!+"%", forSegmentAtIndex: 2)
        PercentageLabel1.text = defaults.stringForKey("Segment1")!+".0"
        PercentageLabel2.text = defaults.stringForKey("Segment2")!+".0"
        PercentageLabel3.text = defaults.stringForKey("Segment3")!+".0"
        
    }
    
    @IBAction func StepperValueChanged(sender: UIStepper) {
        
     self.PercentageLabel1.text = sender.value.description
    }
    
    @IBAction func StepperValueChanged2(sender: UIStepper) {
        self.PercentageLabel2.text = sender.value.description
    }
    
    @IBAction func StepperValueChanged3(sender: UIStepper) {
        self.PercentageLabel3.text = sender.value.description
    }
    
    @IBAction func onButtonPress(sender: UIButton) {
        
        var temp = PercentageLabel1.text!.componentsSeparatedByString(".")
        Stepper1.value = (temp[0] as NSString).doubleValue
        PercentageSegmented.setTitle(temp[0]+"%", forSegmentAtIndex: 0)
        temp = PercentageLabel2.text!.componentsSeparatedByString(".")
        PercentageSegmented.setTitle(temp[0]+"%", forSegmentAtIndex: 1)
        temp = PercentageLabel3.text!.componentsSeparatedByString(".")
        PercentageSegmented.setTitle(temp[0]+"%", forSegmentAtIndex: 2)
        let defaults = NSUserDefaults.standardUserDefaults()
        var value1 = PercentageLabel1.text!.componentsSeparatedByString(".")[0]
        var value2 = PercentageLabel2.text!.componentsSeparatedByString(".")[0]
        var value3 = PercentageLabel3.text!.componentsSeparatedByString(".")[0]
        defaults.setValue(value1, forKey: "Segment1")
        defaults.setValue(value2, forKey: "Segment2")
        defaults.setValue(value3, forKey: "Segment3")
        defaults.synchronize()

    }
   
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
    }

   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
       
        
    }
*/


}
