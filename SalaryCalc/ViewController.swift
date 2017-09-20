//
//  ViewController.swift
//  SalaryCalc
//
//  Created by Pawel Furtek on 5/23/16.
//  Copyright © 2016 Pawel Furtek. All rights reserved.
//

import UIKit

class ColoredDatePicker: UIDatePicker {
    var changed = false
    override func addSubview(view: UIView) {
        if !changed {
            changed = true
            self.setValue(UIColor(colorLiteralRed: 129/255, green: 204/255, blue: 206/255, alpha: 1.0), forKey: "textColor")
        }
        super.addSubview(view)
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var salaryAmount: UITextField!
    @IBOutlet weak var currencyPicker: UIPickerView!
    let currencies = ["$", "£", "zł", "€", "§"]
    var model = ModelManager.sharedManager.model
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if (salaryAmount.text!.characters.count==0) {
            return false
        }
        if (salaryAmount.text!.componentsSeparatedByString(".").count > 2) {
            return false
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //CHECK NUMBER OF COMMAS, IF >1 THEN ALERT
        if (salaryAmount.text!.characters.count==0) {
        }
        model.time = timePicker.date
        model.salary = (salaryAmount.text! as NSString).doubleValue
        model.currency = currencies[currencyPicker.selectedRowInComponent(0)]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let title = currencies[row]
        let myTitle = NSAttributedString(string: title, attributes: [NSFontAttributeName:UIFont(name: "HelveticaNeue", size: 20.0)!,NSForegroundColorAttributeName:UIColor(colorLiteralRed: 129/255, green: 204/255, blue: 206/255, alpha: 1.0)])
        pickerLabel.attributedText = myTitle
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        return pickerLabel
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        salaryAmount.resignFirstResponder()
    }

}

