//
//  ViewController.swift
//  Days Counter
//
//  Created by Ratnaganesh j.rasamy on 05/12/2017.
//  Copyright © 2017 iscistech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var choosefromdate: UIButton!
    @IBOutlet weak var choosetodate: UIButton!
    @IBOutlet weak var noofdays: UILabel!
    
    
    @IBAction func choosefromdateAction(_ sender: Any) {
        
        if(choosefromdate.currentTitle == "" || choosefromdate.currentTitle == "Choose From Date") {
            
            let datePickerView: UIDatePicker = UIDatePicker()
            
            datePickerView.datePickerMode = UIDatePickerMode.date
            
            sender.inputView = datePickerView
            
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .medium
            
            formatter.dateFormat = "MMMM dd,yyyy"
            
            
            choosefromdate.setTitle( formatter.string(from: currentDateTime), for: .normal)
            
            datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
            
        }
        
        
        choosefromdate.backgroundColor = UIColor.white
        //choosefromdate.textColor = UIColor.black
        
        if(choosefromdate.currentTitle != "Choose From Date" && choosetodate.currentTitle != "Choose To Date"){
            noofdaysfunc()
            
        }
    }
    
    @IBAction func choosefromdateEditing(_ sender: UITextField) {
        
        if(choosefromdate.currentTitle == "" || choosefromdate.currentTitle == "Choose From Date") {
            
            let datePickerView: UIDatePicker = UIDatePicker()
            
            datePickerView.datePickerMode = UIDatePickerMode.date
            
            sender.inputView = datePickerView
            
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .medium
            
            formatter.dateFormat = "MMMM dd,yyyy"
            
           
             choosefromdate.setTitle( formatter.string(from: currentDateTime), for: .normal)
            
            datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
            
        }
        
        
        choosefromdate.backgroundColor = UIColor.white
        //choosefromdate.textColor = UIColor.black
        
        if(choosefromdate.currentTitle != "Choose From Date" && choosetodate.currentTitle != "Choose To Date"){
            noofdaysfunc()
            
        }
        
        
        
    }
    
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        
        choosefromdate.setTitle( dateFormatter.string(from: sender.date), for: .normal)
        
        if(choosefromdate.currentTitle != "Choose From Date" && choosetodate.currentTitle != "Choose To Date"){
            noofdaysfunc()
            
        }
        
    }
    
    
    
    @IBAction func choosetodateAction(_ sender: Any) {
        
        if(choosetodate.currentTitle == "" || choosetodate.currentTitle == "Choose Date To") {
            
            
            let datePickerView: UIDatePicker = UIDatePicker()
            
            datePickerView.datePickerMode = UIDatePickerMode.date
            
            sender.inputView = datePickerView
            
            
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .medium
            
            formatter.dateFormat = "MMMM dd,yyyy"
            
            choosetodate.setTitle(formatter.string(from: currentDateTime), for: .normal)
            
            datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChangedforto), for: UIControlEvents.valueChanged)
            
            
        }
        
        
        choosetodate.backgroundColor = UIColor.white
        //        choosetodate.tintColor = UIColor.black
        
        if(choosefromdate.currentTitle != "Choose From Date" && choosetodate.currentTitle != "Choose To Date"){
            noofdaysfunc()
            
        }
        
    }
    
    
    
    @IBAction func choosetodateEditing(_ sender: UITextField) {
        
        if(choosetodate.currentTitle == "" || choosetodate.currentTitle == "Choose Date To") {
            
            
            let datePickerView: UIDatePicker = UIDatePicker()
            
            datePickerView.datePickerMode = UIDatePickerMode.date
            
            sender.inputView = datePickerView
            
            
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .medium
            
            formatter.dateFormat = "MMMM dd,yyyy"
            
            choosetodate.setTitle(formatter.string(from: currentDateTime), for: .normal)
            
            datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChangedforto), for: UIControlEvents.valueChanged)
            
            
        }
        
        
        choosetodate.backgroundColor = UIColor.white
//        choosetodate.tintColor = UIColor.black
        
        if(choosefromdate.currentTitle != "Choose From Date" && choosetodate.currentTitle != "Choose To Date"){
            noofdaysfunc()
            
        }
        
        
        
    }
    
    
    
    
    @objc func datePickerValueChangedforto(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        
        choosetodate.setTitle(dateFormatter.string(from: sender.date), for: .normal)
        
        
        
        if(choosefromdate.currentTitle != "Choose From Date" && choosetodate.currentTitle != "Choose To Date"){
            noofdaysfunc()
            
        }
        
    }
    
    func noofdaysfunc(){
       
        
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        
        let yesterday = dateFormatter.date(from: choosefromdate.currentTitle!)
        let tomorrow = dateFormatter.date(from: choosetodate.currentTitle!)
        
        
        let diff = tomorrow?.timeIntervalSince(yesterday!)
        
        let components = Calendar.current.dateComponents([.day], from: yesterday!, to: tomorrow!)
        var daysno =  Double(components.day!)
        
        
            daysno = daysno + 1
            
            var arraydate : [NSDate] = []
            //arraydate.append(yesterday as! NSDate)
            daysno = Double(coutDays(from: yesterday as! NSDate,to: tomorrow as! NSDate, holidayslist: holidayslist as! [NSDate]).workingDays)
        
        
        noofdays.text = daysno.description
        
    }
    
    func coutDays(from start: NSDate, to end: NSDate, holidayslist : [NSDate]) -> (weekendDays: Int, workingDays: Int) {
        guard start.isLessThanDate(dateToCompare: end)  else { return (0,0) }
        var weekendDays = 0
        var workingDays = 1
        var date = start
        repeat {
            if date.isDateWeekend {
                weekendDays +=  1
            } else {
                workingDays += 1
            }
            
            for dates in holidayslist {
                if (date.isEqual(to: dates as Date)){
                    workingDays -= 1
                    break;
                }
            }
            
            
            
            
            date = date.tomorrow
        } while date.isLessThanDate(dateToCompare: end)
        return (weekendDays, workingDays)
    }
    
}

struct Cal {
    static let iso8601 = NSCalendar(identifier: NSCalendar.Identifier.ISO8601)!
}

extension NSDate {
    var isDateWeekend: Bool {
        return Cal.iso8601.isDateInWeekend(self as Date)
    }
    var tomorrow: NSDate {
        return Cal.iso8601.date(byAdding: .day, value: 1, to: self as Date, options: .matchNextTime)! as NSDate
    }
}

extension NSDate {
    func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func addDays(daysToAdd: Int) -> NSDate {
        let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: NSDate = self.addingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addHours(hoursToAdd: Int) -> NSDate {
        let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: NSDate = self.addingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
}


