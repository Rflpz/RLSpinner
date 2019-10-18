//
//  ViewController.swift
//  RLSpinner
//
//  Created by Rflpz on 10/17/2019.
//  Copyright (c) 2019 Rflpz. All rights reserved.
//

import UIKit
import RLSpinner

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: {
            RLSpinner.shared.display(in: self.view)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
            RLSpinner.shared.hide()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

