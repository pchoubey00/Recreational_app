//
//  readcell.swift
//  Recreation
//
//  Created by Prinaya Choubey on 12/3/20.
//  Copyright © 2020 Prinaya Choubey. All rights reserved.
//

import UIKit
import CoreData 

class readcell: UITableViewCell {

    @IBOutlet weak var bookLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with item: Item) {
            
           if let book = item.value(forKey: "book") as? String,
               let genre = item.value(forKey: "genre") as? String,
            let rating = item.value(forKey: "rating") as? Int
            
              {
               
               
               ratingLabel?.text = String(rating)
                bookLabel?.text = book
                genreLabel?.text = genre
               
               
            
           }
       }
    

}
