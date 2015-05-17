//
//  ViewController.swift
//  Text Field Delegates
//
//  Created by Jon Gordon on 17/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!

    // Delegate objects

    // Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Set label to be hidden
        self.characterCountLabel.hidden = false

        // Set the delegates
    }

    // Text Field Delegate methods
}

