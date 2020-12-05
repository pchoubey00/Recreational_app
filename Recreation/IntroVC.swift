//
//  IntroVC.swift
//  Recreation
//
//  Created by Prinaya Choubey on 12/3/20.
//  Copyright © 2020 Prinaya Choubey. All rights reserved.
//

import UIKit

class IntroVC: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var earthImage: UIImageView!
    
    @IBOutlet weak var label4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label1?.text = Bundle.main.displayName
        label2?.text = Bundle.main.version
        label3?.text = Bundle.main.build
        label4?.text = NSLocalizedString("copyright", comment: "")
       
        earthImage.rotate360Degrees()
      
    
   
     

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 5.0, animations: {
            self.label1.alpha = 1.0
            self.label2.alpha = 1.0
            self.label3.alpha = 1.0
            self.label4.alpha = 1.0
            
              })
    }
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
}
