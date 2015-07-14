//
//  ViewController.swift
//  Psychologist
//
//  Created by Ricardo Gehrke Filho on 14/07/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination: UIViewController?
        destination = segue.destinationViewController
        
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        
        if let fvc = destination as? FaceViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "megazords": fvc.hapiness = 100
                case "nothing": fvc.hapiness = 40
                case "florests on fire": fvc.hapiness = 0
                default: fvc.hapiness = 50
                }
            }
        }
    }
    
}

