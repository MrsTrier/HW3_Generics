//
//  ViewController.swift
//  PersistentStorage
//
//  Created by Roman Cheremin on 11/10/2019.
//  Copyright © 2019 Roman Cheremin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let box = Box()
        
        // My test values to put in the box
        let bool = true
        let line = "Supper test"
        let integer = 21

        
        // Puting things in the box
        box.put(this: bool, withKey: "my boolean constant")
        
        box.put(this: line, withKey: "my string")
        
        box.put(this: integer, withKey: "my int")
        
        // Success test
        let win: Result<Int, Error> = box.give(key: "my int")
        switch win  {
        case .success(let congrats): print("Succsess:\n\(congrats)")
        case .failure( _): break
        }
        
        // Failure tests
        let errorNotFound: Result<Bool, Error> = box.give(key: "my string")
        switch errorNotFound {
        case .success(let congrats): print("Succsess:\n\(congrats)")
        case .failure( _): break
        }
        
        let errorAnoterType: Result<Int, Error> = box.give(key: "my double")
        switch errorAnoterType  {
        case .success(let congrats): print("Succsess:\n\(congrats)")
        case .failure( _): break
        }
    
    }
}

