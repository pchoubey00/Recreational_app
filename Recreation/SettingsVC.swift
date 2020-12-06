//
//  SettingsVC.swift
//  Recreation
//
//  Created by Prinaya Choubey on 12/4/20.
//  Copyright © 2020 Prinaya Choubey. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    let defaults = UserDefaults.standard
    //rgb(173,230,216)
    @IBOutlet weak var otherbox1: UIView!
    
    @IBOutlet weak var changebutton: UIButton!
    @IBOutlet weak var animationlabel: UILabel!
    @IBOutlet weak var backgroundlabel: UILabel!
    @IBOutlet weak var settingsTitle: UILabel!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var otherbox2: UIView!
    @IBOutlet weak var otherbox: UIView!
    @IBOutlet weak var maroonbox2: UIView!
    @IBOutlet weak var maroonbox1: UIView!
    @IBOutlet weak var maroonbox: UIView!
    @IBOutlet weak var picker: UIPickerView!
    //let ivc = IntroVC()
    @IBOutlet weak var aniswitch: UISwitch!
    var pickerstuff = [NSLocalizedString("Teal", comment: ""), NSLocalizedString("Pink", comment: ""), NSLocalizedString("Yellow", comment: "")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        back.setTitle(NSLocalizedString("back", comment: ""), for: .normal)
        self.maroonbox1.backgroundColor = UIColor.green
        self.maroonbox2.backgroundColor = UIColor.systemIndigo
        self.picker.delegate = self
        self.picker.dataSource = self
        if let preferredColor = defaults.object(forKey: "backgroundcolor") as? Int {
                if preferredColor == 0{
                    self.view.backgroundColor = UIColor(red: CGFloat(173.0/255.0), green: CGFloat(230.0/255.0), blue: CGFloat(216.0/255.0), alpha: CGFloat(1.0))
                } else if preferredColor == 1{
                    self.view.backgroundColor = UIColor(red: CGFloat(244.0/255.0), green: CGFloat(194.0/255.0), blue: CGFloat(194.0/255.0), alpha: CGFloat(1.0))
                } else if preferredColor == 2{
                    self.view.backgroundColor = UIColor.systemYellow
                }
             }
        settingsTitle.text = NSLocalizedString("settings", comment: "")
        animationlabel.text = NSLocalizedString("animation", comment: "")
        backgroundlabel.text = NSLocalizedString("background", comment: "")
        changebutton.setTitle(NSLocalizedString("change", comment: ""), for: .normal)
        
        


    
    }
    override func viewWillAppear(_ animated: Bool) {
        
        aniswitch.isOn = defaults.bool(forKey: "Animation")
        if let preferredColor = defaults.object(forKey: "backgroundcolor") as? Int {
                      if preferredColor == 0{
                          self.view.backgroundColor = UIColor(red: CGFloat(173.0/255.0), green: CGFloat(230.0/255.0), blue: CGFloat(216.0/255.0), alpha: CGFloat(1.0))
                      } else if preferredColor == 1{
                          self.view.backgroundColor = UIColor(red: CGFloat(244.0/255.0), green: CGFloat(194.0/255.0), blue: CGFloat(194.0/255.0), alpha: CGFloat(1.0))
                      } else if preferredColor == 2{
                          self.view.backgroundColor = UIColor.systemYellow
                      }
                   }
     

        //picker.selectedRow(inComponent: 0)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onChangebtn(_ sender: UIButton) {
        defaults.set(aniswitch.isOn, forKey: "Animation")
        defaults.set(picker.selectedRow(inComponent: 0), forKey: "backgroundcolor")
       
        print(picker.selectedRow(inComponent: 0))
        if let preferredColor = defaults.object(forKey: "backgroundcolor") as? Int {
                      if preferredColor == 0{
                          self.view.backgroundColor = UIColor(red: CGFloat(173.0/255.0), green: CGFloat(230.0/255.0), blue: CGFloat(216.0/255.0), alpha: CGFloat(1.0))
                        
                      } else if preferredColor == 1{
                        self.view.backgroundColor = UIColor(red: CGFloat(244.0/255.0), green: CGFloat(194.0/255.0), blue: CGFloat(194.0/255.0), alpha: CGFloat(1.0))
                       
                      } else if preferredColor == 2{
                          self.view.backgroundColor = UIColor.systemYellow
                        
                      }
                   }
        //print(String(aniswitch.isOn))
        print(String(defaults.bool(forKey: "Animation")))
        self.maroonbox1.backgroundColor = UIColor.green
            self.maroonbox2.backgroundColor = UIColor.systemIndigo
        
        UIView.transition(with: maroonbox, duration: 0.5,
                          options: [.transitionFlipFromRight,
                                    .showHideTransitionViews],
                          animations: {
            self.maroonbox1.alpha = 0
            self.maroonbox2.alpha = 1
        }){ _ in
            self.maroonbox1.isHidden = true
            self.maroonbox2.isHidden = false
            self.maroonbox1.isUserInteractionEnabled = false
            self.maroonbox2.isUserInteractionEnabled = true
        }
        UIView.transition(with: otherbox, duration: 0.5,
                             options: [.transitionFlipFromLeft,
                                       .showHideTransitionViews],
                             animations: {
               self.otherbox1.alpha = 0
               self.otherbox2.alpha = 1
           }){ _ in
               self.otherbox1.isHidden = true
               self.otherbox2.isHidden = false
               self.otherbox1.isUserInteractionEnabled = false
               self.otherbox2.isUserInteractionEnabled = true
           }

       
        
    }
    
    
    
}
extension SettingsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerstuff.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerstuff[row]
    }
    
    
    
}
