//
//  DiagnosedHapinessViewController.swift
//  Psychologist
//
//  Created by Ricardo Gehrke Filho on 14/07/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class DiagnosedHapinessViewController: FaceViewController, UIPopoverPresentationControllerDelegate
{
    override var hapiness: Int {
        didSet {
            diagnoseHistory += [hapiness]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnoseHistory: [Int] {
        get { return defaults.objectForKey("DiagnosedHapinessViewController.History") as? [Int] ?? [] }
        set { defaults.setObject(newValue, forKey: "DiagnosedHapinessViewController.History") }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "history":
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnoseHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
}
