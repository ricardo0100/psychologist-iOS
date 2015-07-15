//
//  TextViewController.swift
//  Psychologist
//
//  Created by Ricardo Gehrke Filho on 14/07/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textView?.text = text
        }
    }

}
