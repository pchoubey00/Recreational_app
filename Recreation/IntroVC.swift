//
//  IntroVC.swift
//  Recreation
//
//  Created by Prinaya Choubey on 12/3/20.
//  Copyright © 2020 Prinaya Choubey. All rights reserved.
//

import UIKit

class IntroVC: UIViewController {
 let defaults = UserDefaults.standard
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var airplane4: UIImageView!
    @IBOutlet weak var airplane3: UIImageView!
    @IBOutlet weak var airplane2: UIImageView!
    @IBOutlet weak var airplane1: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var earthImage: UIImageView!
    
    @IBOutlet weak var read: UIButton!
    @IBOutlet weak var travel: UIButton!
    @IBOutlet weak var label4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label1?.text = Bundle.main.displayName
        label2?.text = Bundle.main.version
        label3?.text = Bundle.main.build
        label4?.text = NSLocalizedString("copyright", comment: "")
        self.airplane1.isHidden = false
        self.airplane2.isHidden = false
        self.airplane3.isHidden = false
        self.airplane4.isHidden = false
    
        //earthImage.rotate360Degrees()
        settings.setTitle(NSLocalizedString("settings", comment: ""), for: .normal)
        travel.setTitle(NSLocalizedString("travel", comment: ""), for: .normal)
        read.setTitle(NSLocalizedString("read", comment: ""), for: .normal)
        self.view.addGestureRecognizer(leftSwipeGestureRecognizer)
        self.view.addGestureRecognizer(rightSwipeGestureRecognizer)
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { _ in
                    
                        let alert = UIAlertController(title: NSLocalizedString("hello", comment: ""),
                                                      message: NSLocalizedString("welcome1", comment: ""),
                                                      preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("okay", comment: ""), style: .cancel))
                        self.present(alert, animated: true)
                    }
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { _ in
                        
                            let alert = UIAlertController(title: NSLocalizedString("glad", comment: ""),
                                                          message: NSLocalizedString("welcome", comment: ""),
                                                          preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                            self.present(alert, animated: true)
                        }
        
    
        
 
        
      
    
   
     

        // Do any additional setup after loading the view.
    }
  
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 5.0, animations: {
            self.label1.alpha = 1.0
            self.label2.alpha = 1.0
            self.label3.alpha = 1.0
            self.label4.alpha = 1.0
            
              })
        if let preferredColor = defaults.object(forKey: "backgroundcolor") as? Int {
           if preferredColor == 0{
               self.view.backgroundColor = UIColor(red: CGFloat(173.0/255.0), green: CGFloat(230.0/255.0), blue: CGFloat(216.0/255.0), alpha: CGFloat(1.0))
           } else if preferredColor == 1{
               self.view.backgroundColor = UIColor(red: CGFloat(244.0/255.0), green: CGFloat(194.0/255.0), blue: CGFloat(194.0/255.0), alpha: CGFloat(1.0))
           } else if preferredColor == 2{
               self.view.backgroundColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(161.0/255.0), alpha: CGFloat(1.0))
           }
        }
        if let preferredAnimation = defaults.object(forKey: "Animation") as? Bool{
            if preferredAnimation == true {
               earthImage.rotate360Degrees()
            }
        }
        view.reloadInputViews()
        //self.loadView()
       
    }
    
    @objc func swipedLeft(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            self.airplane1.isHidden = true
                  self.airplane2.isHidden = true
                  self.airplane3.isHidden = true
                  self.airplane4.isHidden = true
            print("Swiped left")
        }
    }
    @objc func swipedRight(sender: UISwipeGestureRecognizer) {
           if sender.state == .ended {
            self.airplane1.isHidden = false
                            self.airplane2.isHidden = false
                            self.airplane3.isHidden = false
                            self.airplane4.isHidden = false
               print("Swiped right")
           }
       }
    
    lazy var leftSwipeGestureRecognizer: UISwipeGestureRecognizer = {
         let gesture = UISwipeGestureRecognizer()
         gesture.direction = .left
         gesture.addTarget(self, action: #selector(swipedLeft))
         return gesture
     }()
     
     lazy var rightSwipeGestureRecognizer: UISwipeGestureRecognizer = {
         let gesture = UISwipeGestureRecognizer()
         gesture.direction = .right
         gesture.addTarget(self, action: #selector(swipedRight))
         return gesture
     }()
    


    
    @IBAction func onTravel(_ sender: Any) {
  
            }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    

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
