//
//  MainViewController.swift
//  SalaryCalc
//
//  Created by Pawel Furtek on 5/23/16.
//  Copyright © 2016 Pawel Furtek. All rights reserved.
//

import UIKit

extension Double {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self) as String
    }
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    var timer: NSTimer?
    var model = ModelManager.sharedManager.model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let seconds = model.salary*100
        timer = NSTimer.scheduledTimerWithTimeInterval(3600/seconds, target: self, selector: #selector(MainViewController.updateTimeLabel), userInfo: nil, repeats: true)
        
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        otherLabel.text = "Since \(formatter.stringFromDate(model.time)) you have earned:"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        //let formatter = NSDateFormatter()
        //formatter.timeStyle = .MediumStyle
        //timeLabel.text = formatter.stringFromDate(clock.currentTime)
        if (model.currency == "zł") {
            salaryLabel.text = "\(model.earnedToday(NSDate()).format(".2")) " + model.currency
        } else {
            salaryLabel.text = model.currency + " \(model.earnedToday(NSDate()).format(".2"))"
        }
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }


}
