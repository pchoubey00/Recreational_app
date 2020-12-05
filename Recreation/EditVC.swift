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

    @IBOutlet weak var bookTextField: UITextField!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingStepper: UIStepper!
    
    @IBOutlet weak var genreTextField: UITextField!
    var rating = 0 {
           willSet {
               ratingLabel?.text = newValue.description
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingStepper.value = 3

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
        presentingViewController?.dismiss(animated: true)
        
    }
    

}
