//
//  ViewController.swift
//  Text Field Delegates
//
//  Created by Jon Gordon on 17/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!

    // Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colouriserDelegate = ColouriserTextFieldDelegate()

    // Lifecycle methods
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Set label to be hidden
        self.characterCountLabel.hidden = false

        // Set the delegates
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colouriserDelegate
        self.textField3.delegate = self
    }

    // Text Field Delegate methods
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)

        // Hide the label if the newText will be an empty string
        self.characterCountLabel.hidden = (newText.length == 0);

        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)

        // Returning true gives the text field permission to change its text
        return true
    }
}

