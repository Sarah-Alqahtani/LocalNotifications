//
//  ViewController.swift
//  LocalNotifications
//
//  Created by admin on 20/12/2021.
//

import UIKit

class ViewController: UIViewController {
//button bar
    @IBOutlet weak var list: UIButton!
    @IBOutlet weak var Cancel: UIBarButtonItem!
    @IBOutlet weak var Add: UIBarButtonItem!
//Stack2
    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var Workuntil: UILabel!
    @IBOutlet weak var StratTimme: UIButton!
//Stack1
    @IBOutlet weak var ShowMints: UILabel!
    @IBOutlet weak var TotalTime: UILabel!
    @IBOutlet weak var TimerSet: UILabel!
   var i=0

    let minutes = ["5 Minutes", "10 Minutes", "20 Minutes", "30 Minutes"]
    var record: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//Action
    @IBAction func StartTimeBtn(_ sender: Any) {
               var timeSelected = 5
               switch(i){
               case 0: timeSelected = 5
               case 1: timeSelected = 10
               case 2: timeSelected = 20
               case 3: timeSelected = 30
               default: print("")
    }
        TotalTime.text = "Total Time: \(timeSelected)"
         ShowMints.text = "0 hours, \(timeSelected) min"
     TimerSet.text = "\(timeSelected) minute timer set"
         let formatter = DateFormatter()
             formatter.dateFormat = "hh:mm a"
                 Workuntil.text = "Work until: \(formatter.string(from: getDate(min:timeSelected)))"
                record.append("\(formatter.string(from: getDate(min:0))) - \(formatter.string(from: getDate(min:timeSelected)))... \(timeSelected) minute timer")
             let dialogConfirm = UIAlertController(title: "\(timeSelected) min countdown", message: "After \(timeSelected) Minutes, you'll be notified.\nTurn your ringer on", preferredStyle: .alert)
             let yes = UIAlertAction(title: "OK", style: .default, handler: nil)
             dialogConfirm.addAction(yes)
                     present(dialogConfirm, animated: true, completion: nil)
                     
                     var temp = timeSelected * 65
                     
         Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                         if temp > 0{
                             temp -= 1
                         }
                         else{
                             self.TotalTime.text = "Total Time:"
                             self.ShowMints.text = "0 hours, 0 min"
                             self.TimerSet.text = ""
                             self.Workuntil.text = ""
                             
                             Timer.invalidate()
                             
                         }}
                     
         func getDate(min: Int) -> Date{
         return Date().addingTimeInterval(Double(min) * 60.0)
                                }
    

@IBAction func AddBtn (_ sender: Any){
        
                hiddin(hiddin: false)
               let dialogConfirm = UIAlertController(title: "Are you sure it's a new day?", message: "", preferredStyle: .alert)
               
               let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
               
               let yes = UIAlertAction(title: "New Day", style: .default, handler: { [self] (action) -> Void in
                   TotalTime.text = "Total Time:"
                   ShowMints.text = "0 hours, 0 min"
                   TimerSet.text = ""
                   Workuntil.text = ""
                   record.removeAll()
    })
        yes.setValue(UIColor.red, forKey: "titleTextColor")
        
        dialogConfirm.addAction(cancel)
        dialogConfirm.addAction(yes)
        present(dialogConfirm, animated: true, completion: nil)
    }
        
    
@IBAction func ListBtn(_ sender: Any){
        hiddin(hiddin: true
                    }
    
    @IBAction func CancelBtn(_ sender: Any) {
         if TotalTime.text != "Total Time:"{
        let dialogConfirm = UIAlertController(title: "Cancel current timer?", message: "", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        let yes = UIAlertAction(title: "Yes", style: .default, handler: { [self] (action) -> Void in
           
                TotalTime.text = "Total Time:"
                ShowMints.text = "0 hours, 0 min"
                TimerSet.text = ""
                Workuntil.text = ""
            record.append("CANCELED")

        })
        yes.setValue(UIColor.red, forKey: "titleTextColor")
        
        dialogConfirm.addAction(cancel)
        dialogConfirm.addAction(yes)
        present(dialogConfirm, animated: true, completion: nil)
    }else{
        hiddin(hiddin: false)
    }
}
}
 
        
func hiddin(hiddin: Bool){
    list.isHidden=hiddin
    StratTimme.isHidden=hiddin
    PickerView.isHidden=hiddin
    Workuntil.isHidden=hiddin
    ShowMints.isHidden=hiddin
    TotalTime.isHidden=hiddin
    TimerSet.isHidden=hiddin
    
        }
    
 
        
                    }

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return minutes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return minutes[row]
    }
    
        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    
            return NSAttributedString(string: minutes[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        i=row
    }
}


    
