//
//  nationgroup.swift
//  Recreation
//
//  Created by Prinaya Choubey on 12/3/20.
//  Copyright © 2020 Prinaya Choubey. All rights reserved.
//

import Foundation
class nationgroup{
    var nations = [nation]()
    func addnation(name : String, capital : String){
        nations.append(nation(name : name, capital : capital ))
    }
}
