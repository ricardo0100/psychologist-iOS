//
//  ViewController.swift
//  Psychologist
//
//  Created by Ricardo Gehrke Filho on 14/07/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let fvc = segue.destinationViewController as? FaceViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "megazords": fvc.hapiness = 100
                case "florests on fire": fvc.hapiness = 0
                default: fvc.hapiness = 50
                }
            }
        }
    }
}

