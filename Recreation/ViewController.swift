//
//  ViewController.swift
//  Recreation
//
//  Created by Prinaya Choubey on 12/3/20.
//  Copyright © 2020 Prinaya Choubey. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    
    var nations = [String:String]()
    var nationgroup : nationgroup!
    var capitalarray = [String]()
    var namearray = [String]()
    var names = String()
    var capitals = String()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
          let url = URL(string: "https://restcountries.eu/rest/v2/region/oceania?fields=name;capital")!
          let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
          let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
          let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: String]]
                
                
                
        
                
                print(dataDictionary)
                print(dataDictionary.count)
                let marco = Array(dataDictionary[0].keys)[0]
                print(marco)
                for i in 0...26{
                    if Array(dataDictionary[i].keys)[0] == "capital"{
                    self.capitalarray.append(Array(dataDictionary[i].values)[0])
                    }else {
                        self.capitalarray.append(Array(dataDictionary[i].values)[1])
                        
                    }
                }
                
                for i in 0...26{
                    if Array(dataDictionary[i].keys)[0] == "name"{
                    self.namearray.append(Array(dataDictionary[i].values)[0])
                    }else {
                        self.namearray.append(Array(dataDictionary[i].values)[1])
                        
                    }
                }
                
                print(self.capitalarray)
                print(self.namearray)
         
            
               
                // Do any additional setup after loading the view.
                self.tableView.reloadData()
            }


        }
                task.resume()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        capitalarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "capitalCell") as! capitalCell
        
        let capital = capitalarray[indexPath.row]
        let country = namearray[indexPath.row]
        cell.countryLabel!.text = country
        cell.capitalLabel!.text = capital
        
        return cell
        
    }


    @IBAction func onBackbtn(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    
}

