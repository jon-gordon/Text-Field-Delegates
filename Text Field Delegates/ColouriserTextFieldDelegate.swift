//
//  ColouriserTextFieldDelegate.swift
//  Text Field Delegates
//
//  Created by Jon Gordon on 17/05/2015.
//  Copyright (c) 2015 JonGor Software. All rights reserved.
//

import Foundation
import UIKit

class ColouriserTextFieldDelegate: NSObject, UITextFieldDelegate {

    let colours : [String : UIColor] = [
        "red": UIColor.redColor(),
        "orange": UIColor.orangeColor(),
        "yellow": UIColor.yellowColor(),
        "green": UIColor.greenColor(),
        "blue": UIColor.blueColor(),
        "brown": UIColor.brownColor(),
        "black": UIColor.blackColor(),
        "purple": UIColor.purpleColor(),
        "cyan": UIColor.cyanColor(),
        "magenta": UIColor.magentaColor(),
        "white": UIColor.whiteColor(),
    ]

    /**
    * Examines the new string whenever the text changes.  Finds colour words, blends them, and sets the colour
    */
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        var coloursInTheText = [UIColor]()
        var newText: NSString

        // Construct the text that will be in the field if this change is accepted
        newText = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)

        // For each dictionary entry in translations, pull out a string to search for
        for (key, colour) in self.colours {
            if newText.rangeOfString(key, options: NSStringCompareOptions.CaseInsensitiveSearch).location != NSNotFound {
                coloursInTheText.append(colour)
            }
        }

        // If we found any colours then blend them and set the text colour
        if coloursInTheText.count > 0 {
            textField.textColor = self.blendColourArray(coloursInTheText)
        }

        return true
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }

    /**
    * Accepts an array of colours, and return a blend of all the elements
    */
    func blendColourArray(colours: [UIColor]) -> UIColor {

        var colourComponents: [CGFloat] = [CGFloat](count: 4, repeatedValue: 0.0)

        for colour in colours {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            colour.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            colourComponents[0] += red
            colourComponents[1] += green
            colourComponents[2] += blue
            colourComponents[3] += alpha
        }

        for i in 0...colourComponents.count - 1 {
            colourComponents[i] /= CGFloat(colours.count)
        }

        return UIColor(red: colourComponents[0], green: colourComponents[1], blue: colourComponents[2], alpha: colourComponents[3])
    }

    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
}