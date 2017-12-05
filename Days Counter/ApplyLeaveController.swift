//
//  ApplyLeaveController.swift
//  HRMS Mini
//
//  Created by Ratnaganesh j.rasamy on 18/07/2017.
//  Copyright © 2017 iscistech. All rights reserved.
//

import Foundation
import Photos
import UIKit
import DropDown
import FileExplorer
import DKImagePickerController
import SCLAlertView


class ApplyLeaveController: UIViewController {
    
    @IBOutlet weak var datefromTextField: UITextField!
    @IBOutlet weak var datetoTextField: UITextField!
    @IBOutlet weak var chooseleaveButton: UIButton!
   
    @IBOutlet weak var fullhalfeveSegment: UISegmentedControl!
    @IBOutlet weak var noofdaysLabel: UILabel!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var browseattachmentButton: UIButton!
    @IBOutlet weak var pickerTextFieldleavetype: UITextField!
    @IBOutlet weak var applyleavebutton: UIButton!
   
    @IBOutlet weak var applyleavenavigationitem: UINavigationItem!
    @IBOutlet weak var backbarbutton: UIBarButtonItem!
    
    
    let dropDown = DropDown()
    let fileExplorer = FileExplorerViewController()
    let pickerController = DKImagePickerController()
    
    
    
    func toenglish(){
        
        
        if applyleavebutton != nil {
            applyleavebutton.setTitle("Apply Leave", for: .normal)
        }
        
        if applyleavenavigationitem != nil {
            applyleavenavigationitem.title = "Apply Leave"
        }
        
        if backbarbutton != nil {
            backbarbutton.title = "Back"
        }
        
    }
    
    func tomalay(){
        
        if applyleavebutton != nil {
            applyleavebutton.setTitle("Permohonan Cuti", for: .normal)
        }
        
        if applyleavenavigationitem != nil {
            applyleavenavigationitem.title = "Permohonan Cuti"
        }
        
        if backbarbutton != nil {
            backbarbutton.title = "Belakang"
        }
        
        
    }
    public func changeLanguages(){
        
        
        let preferences = UserDefaults.standard
        if preferences.object(forKey: UserOBJ.instance.KEYappLang) == nil {
            
            toenglish()
            
        } else {
            
            let currentLevel = preferences.integer(forKey: UserOBJ.instance.KEYappLang)
            
            if currentLevel == 1 {
                
                tomalay()
                
            }else{
                
                toenglish()
            }
        }
        
        
        
        
    }
    
    
    
    
    override func viewWillAppear(_ sender : Bool){
        super.viewWillAppear(true)
        changeLanguages()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // browseattachmentButton.isHidden = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       
    @IBOutlet weak var applyleave: UIButton!
    
    @IBAction func applyleaveSaveBtn(_ sender: Any) {
        
        
        
        let staffno : String;var leavetypeid : Int;var leavetype : String;let leavereason : String;var fromdate : String;
        var todate : String;var ishalfday : Bool;var ismorning : Bool;var isevening : Bool;var encodeddocument : String
        var filename : String;var filetype : String;var leavetypeshortname : String
        
        
        var required: Bool = false
        
        
        if let text = chooseleaveButton.titleLabel?.text {
            if text == "Choose Leave Type"{
                chooseleaveButton.backgroundColor = UIColorFromRGB(rgbValue: redcolorcode)
                required = true
            }else{
                chooseleaveButton.backgroundColor = self.UIColorFromRGB(rgbValue: self.bluecolorcode)
            }
        }
        
        if let text = datefromTextField.text {
            if text == "Choose Date From"{
                datefromTextField.backgroundColor = UIColorFromRGB(rgbValue: redcolorcode)
                datefromTextField.textColor = UIColor.white
                required = true
            }else{
                datefromTextField.backgroundColor = UIColor.white
                datefromTextField.textColor = UIColor.black
            }
        }
        
        
        if let text = datetoTextField.text {
            if text == "Choose Date To"{
                datetoTextField.backgroundColor = UIColorFromRGB(rgbValue: redcolorcode)
                datetoTextField.textColor = UIColor.white
                required = true
            }else{
                datetoTextField.backgroundColor = UIColor.white
                datetoTextField.textColor = UIColor.black
            }
        }
        
        
        if let text = reasonTextField.text {
            if text == ""{
                reasonTextField.backgroundColor = UIColorFromRGB(rgbValue: redcolorcode)
                reasonTextField.textColor = UIColor.white
                
                required = true
            }else{
                reasonTextField.backgroundColor = UIColor.white
                reasonTextField.textColor = UIColor.black
            }
        }
        
        if let text = chooseleaveButton.titleLabel?.text {
            if text == "Medical Leave"{
                if let text1 = browseattachmentButton.titleLabel?.text {
                    if text1 == "Browse Attachment"{
                        browseattachmentButton.backgroundColor =  UIColorFromRGB(rgbValue: redcolorcode)
                        required = true
                    }else{
                        browseattachmentButton.backgroundColor = UIColorFromRGB(rgbValue: bluecolorcode) //UIColor.blue
                    }                }
            }
        }
        
        
        staffno = UserOBJ.instance.UserId.description
        leavetypeid = 1
        leavetype = "Annual Leave"
        leavereason = reasonTextField.text!
        leavetypeshortname = "AL"
        fromdate = "2017-08-10"
        todate = "2017-08-10"
        ishalfday = false
        ismorning = false
        isevening = false
        encodeddocument = ""
        filename = ""
        filetype = ""
        
        
        
        if required {
            let alert = SCLAlertView()
            alert.showError("Error", subTitle: "Please fill all required fields")
            return
        }
        
        
        
        
        
        if let text = chooseleaveButton.titleLabel?.text {
            if text == "Annual Leave"{
                
                leavetypeid = 1
                leavetype = "Annual Leave"
                leavetypeshortname = "AL"
                
            }else if text == "Medical Leave"{
                
                leavetypeid = 2
                leavetype = "Medical Leave"
                leavetypeshortname = "MDL"
                
            }else if text == "UnPaid Leave"{
                
                leavetypeid = 4
                leavetype = "UnPaid Leave"
                leavetypeshortname = "UL"
                
            }
        }
        
        
        
        
        
        if fullhalfeveSegment.selectedSegmentIndex == 1 {
            ishalfday = true
            ismorning = true
            isevening = false
        }else if fullhalfeveSegment.selectedSegmentIndex == 2 {
            ishalfday = true
            ismorning = false
            isevening = true
        }
        
        
        if let text = datefromTextField.text {
            
            
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "MMMM dd,yyyy"
            let showDate = inputFormatter.date(from: text)
            inputFormatter.dateFormat = "yyyy-MM-dd"
            fromdate = inputFormatter.string(from: showDate!)
            
            
        }
        
        
        if let text = datetoTextField.text {
            
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "MMMM dd,yyyy"
            let showDate = inputFormatter.date(from: text)
            inputFormatter.dateFormat = "yyyy-MM-dd"
            todate = inputFormatter.string(from: showDate!)
            
        }
        
        
        if leavetype == "Medical Leave"{
            
            
            let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            var path = "\(documentsDirectory)/\(UserOBJ.instance.StaffName)_Attachment.jpg"
            
            
            let options = PHImageRequestOptions()
            options.version = .current
            
            pickerController.selectedAssets[0].fetchImageDataForAsset(true, completeBlock:  { (data, _) in
                
                if let imageData = data {
                    filename = "\(UserOBJ.instance.StaffName)_Attachment.jpg"
                    filetype = "jpg"
                    try?  encodeddocument = imageData.base64EncodedString()
                    //try? imageData.write(to: URL(fileURLWithPath: path), options: [.atomic])
                    
                }
            })
            
            
            
            
        }else{
            
            encodeddocument = ""
            filetype = ""
            filename = ""
        }
        
        
        
        if(UserOBJ.instance.VersionId == "v20" ){
            
            
            let outapplyleave : String
            try outapplyleave = HRMSMobile().ApplyLeaveFree(staffno: staffno, LeaveTypeID: leavetypeid, LeaveType: leavetype, LeaveReason: leavereason, FromDate: fromdate, ToDate: todate, IsHalfDay: ishalfday, isMorning: ismorning, isEvening: isevening, EncodedDocument: encodeddocument, filename: filename, fileType: filetype, LeaveTypeShortName: leavetypeshortname)
            
            if outapplyleave.contains("successfully") {
                
                let alert = SCLAlertView()
                alert.showSuccess("Success", subTitle: outapplyleave)
                clearall()
                
                
            }else{
                
                let alert = SCLAlertView()
                alert.showError("Error", subTitle: outapplyleave)
                
                
            }
            
            
            
            
            
            
            
        }else{
            
            
            let outapplyleave : String
            try outapplyleave = HRMSMobile().ApplyLeave(staffno: staffno, LeaveTypeID: leavetypeid, LeaveType: leavetype, LeaveReason: leavereason, FromDate: fromdate, ToDate: todate, IsHalfDay: ishalfday, isMorning: ismorning, isEvening: isevening, EncodedDocument: encodeddocument, filename: filename, fileType: filetype, LeaveTypeShortName: leavetypeshortname)
            
            
            
            if outapplyleave.contains("successfully") {
                
                let alert = SCLAlertView()
                alert.showSuccess("Success", subTitle: outapplyleave)
                clearall()
                
                
            }else{
                
                let alert = SCLAlertView()
                alert.showError("Error", subTitle: outapplyleave)
                
                
            }
            
            
            
            
        }
        
        

        
    }
   
    
    func clearall(){
        
        chooseleaveButton.setTitle("Choose Leave Type", for: .normal)
        datefromTextField.text = "Choose Date From"
        datetoTextField.text = "Choose Date To"
        fullhalfeveSegment.selectedSegmentIndex = 0
        noofdaysLabel.text = "No Of Day(s)"
        browseattachmentButton.setTitle("Browse Attachment", for: .normal)
        reasonTextField.text = ""
        
        HR2eazyminiController.instance?.reloaddata()
    }
    
    let bluecolorcode :UInt = 0x00a2ff
    let redcolorcode :UInt = 0xff8080
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    //var asds :UInt = 0x00a2ff
    
    
  
    
    
    @IBAction func pagegoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    
    @IBAction func reasontextFieldEditing(_ sender: UITextField) {
        
        if let text = reasonTextField.text {
            if text == ""{
                reasonTextField.backgroundColor = UIColorFromRGB(rgbValue: redcolorcode)
                reasonTextField.textColor = UIColor.white
               
            }else{
                reasonTextField.backgroundColor = UIColor.white
                reasonTextField.textColor = UIColor.black
            }
        }

        
    }
    
    
    
    @IBAction func choolseleaveAction(_ sender: UIButton) {
        
        dropDown.anchorView = chooseleaveButton
        dropDown.dataSource = ["Annual Leave", "Medical Leave", "UnPaid Leave"]
        dropDown.width = chooseleaveButton.bounds.width
        
        if dropDown.isHidden {
            dropDown.show()
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
               // print("Selected item: \(item) at index: \(index)")
                 self.chooseleaveButton.setTitle( item, for: .normal)
                 self.chooseleaveButton.backgroundColor = self.UIColorFromRGB(rgbValue: self.bluecolorcode)
                
                if item.contains("Medical Leave") {
                    self.browseattachmentButton.isHidden = false
                    
                }else{
                    self.browseattachmentButton.isHidden = true
                }
                
            }
            
        } else {
           
            dropDown.hide()
        }
        
        
    }
  
    
    
    

    @IBAction func browseattachmentButton(_ sender: Any) {
        
     /*   fileExplorer.fileFilters = [Filter.extension("png,jpg,jpeg")]
        fileExplorer.canChooseFiles = true //specify whether user is allowed to choose files
        fileExplorer.canChooseDirectories = false //specify whether user is allowed to choose directories
        fileExplorer.allowsMultipleSelection = true //specify whether user is allowed to choose multiple files and/or directories
        
 
        self.present(fileExplorer, animated: true, completion: nil)
        
        */
        browseattachmentButton.backgroundColor = UIColorFromRGB(rgbValue: bluecolorcode)
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            if assets.count > 0 {
                self.browseattachmentButton.setTitle("Image Picked",for: .normal)
            }else{
                self.browseattachmentButton.setTitle("Browse Attachment",for: .normal)
            }
            
        }
        
        
        
        self.present(pickerController, animated: true)
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func claimaction(_ sender: UIButton) {
        callAlert()
    }
    
    
    @IBAction func fullmorneveSegmentChange(_ sender: UISegmentedControl) {
        
        if(datefromTextField.text != "Choose Date From" && datetoTextField.text != "Choose Date To"){
            noofdays()
            
        }
    }
    
    
    @IBAction func datefromtextFieldEditing(_ sender: UITextField) {
        
        let datePickerView: UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        
        formatter.dateFormat = "MMMM dd,yyyy"

        datefromTextField.text =  formatter.string(from: currentDateTime)
        datefromTextField.backgroundColor = UIColor.white
        datefromTextField.textColor = UIColor.black
        
        if(datefromTextField.text != "Choose Date From" && datetoTextField.text != "Choose Date To"){
            noofdays()
            
        }
        
        datePickerView.addTarget(self, action: #selector(ApplyLeaveController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }
    
    
    func datePickerValueChanged(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        
        datefromTextField.text = dateFormatter.string(from: sender.date)
        
        if(datefromTextField.text != "Choose Date From" && datetoTextField.text != "Choose Date To"){
            noofdays()
            
        }
        
    }
    
    
    
    
    
    
    @IBAction func datetotextFieldEditing(_ sender: UITextField) {
        
        let datePickerView: UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        
        formatter.dateFormat = "MMMM dd,yyyy"
        
        datetoTextField.text =  formatter.string(from: currentDateTime)
        datetoTextField.backgroundColor = UIColor.white
        datetoTextField.textColor = UIColor.black
        
        if(datefromTextField.text != "Choose Date From" && datetoTextField.text != "Choose Date To"){
            noofdays()
            
        }

        
        datePickerView.addTarget(self, action: #selector(ApplyLeaveController.datePickerValueChangedforto), for: UIControlEvents.valueChanged)
        
    }
    
    
    
    
    func datePickerValueChangedforto(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        
        datetoTextField.text = dateFormatter.string(from: sender.date)
        
        
        
        if(datefromTextField.text != "Choose Date From" && datetoTextField.text != "Choose Date To"){
           noofdays()
            
        }
        
    }
    
    func noofdays(){
        fullhalfeveSegment.setEnabled(true, forSegmentAt: 1)
        fullhalfeveSegment.setEnabled(true, forSegmentAt: 2)

        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none

        
        dateFormatter.dateFormat = "MMMM dd,yyyy"
        
        let yesterday = dateFormatter.date(from: datefromTextField.text!)
        let tomorrow = dateFormatter.date(from: datetoTextField.text!)
        
        
        let diff = tomorrow?.timeIntervalSince(yesterday!)

        let components = Calendar.current.dateComponents([.day], from: yesterday!, to: tomorrow!)
        var daysno =  Double(components.day!)
        
        if components.day == 0 {
            if fullhalfeveSegment.selectedSegmentIndex == 0 {
                daysno = 1
            }else{
                daysno = 0.5
            }
        }else{
            
            fullhalfeveSegment.setEnabled(false, forSegmentAt: 1)
            fullhalfeveSegment.setEnabled(false, forSegmentAt: 2)
            fullhalfeveSegment.selectedSegmentIndex = 0
            daysno = daysno + 1
            
        }

        noofdaysLabel.text = daysno.description
        
    }
    
    
    func callAlert(){
        
        let alertController = UIAlertController(title: "Upgrade New Version", message: "Your organization is using free version. Contact your admin to utilise full features", preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(okAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
}
