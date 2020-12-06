//
//  EditVC.swift
//  Recreation
//
//  Created by Prinaya Choubey on 12/3/20.
//  Copyright © 2020 Prinaya Choubey. All rights reserved.
//

import UIKit
import CoreData

class EditVC: UIViewController {
     let defaults = UserDefaults.standard

    @IBOutlet weak var bookTextField: UITextField!
    
    @IBOutlet weak var genrelabel: UILabel!
    @IBOutlet weak var ratestuff: UILabel!
    @IBOutlet weak var booklabel: UILabel!
    @IBOutlet weak var newentry: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingStepper: UIStepper!
    
    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var cancelbtn: UIButton!
    @IBOutlet weak var genreTextField: UITextField!
    var rating = 0 {
           willSet {
               ratingLabel?.text = newValue.description
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        ratestuff.text = NSLocalizedString("rating", comment: "")
        newentry.text = NSLocalizedString("newentry", comment: "")
        booklabel.text = NSLocalizedString("book", comment: "")
        addbtn.setTitle(NSLocalizedString("add", comment: ""), for: .normal)
        cancelbtn.setTitle(NSLocalizedString("cancel", comment: ""), for: .normal)
        
        ratingStepper.value = 3
        
        if let preferredColor = defaults.object(forKey: "backgroundcolor") as? Int {
                             if preferredColor == 0{
                                 self.view.backgroundColor = UIColor(red: CGFloat(173.0/255.0), green: CGFloat(230.0/255.0), blue: CGFloat(216.0/255.0), alpha: CGFloat(1.0))
                               
                             } else if preferredColor == 1{
                                 self.view.backgroundColor = UIColor(red: CGFloat(244.0/255.0), green: CGFloat(194.0/255.0), blue: CGFloat(194.0/255.0), alpha: CGFloat(1.0))
                              
                             } else if preferredColor == 2{
                                 self.view.backgroundColor = UIColor.systemYellow
                               
                             }
                          }

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true)
     }
    
    


    @IBAction func onRatingChanged(_ sender: UIStepper) {
         rating = Int(sender.value)
    }
    
     @IBAction func onCancel(_ sender: Any) {
         presentingViewController?.dismiss(animated: true)
     }
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction func onAdd(_ sender: Any) {
        let context = AppDelegate.cdContext
        if let book = bookTextField?.text, let genre = genreTextField?.text{
            if let entity = NSEntityDescription.entity(forEntityName: "Item", in: context) {
                 let item = NSManagedObject(entity: entity, insertInto: context)
                item.setValue(book, forKeyPath: "book")
                item.setValue(genre, forKeyPath: "genre")
                item.setValue(Int(ratingStepper.value), forKey: "rating")
                do {
                                  try context.save()
                              } catch let error as NSError {
                                  print("Could not save the item. \(error), \(error.userInfo)")
                              }
            }
        }
        //presentingViewController?.dismiss(animated: true)
        
    }
    

}
