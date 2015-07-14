//
//  FaceViewController.swift
//  Happiness
//
//  Created by Ricardo Gehrke Filho on 13/07/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, FaceViewDataSource
{
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    private struct Constants {
        static let HapinessGestureScale: CGFloat = 4.0
    }
    
    @IBAction func changeHapiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let hapinessChange = -Int(translation.y / Constants.HapinessGestureScale)
            if hapinessChange != 0 {
                hapiness += hapinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
            
        }
    }
    
    var hapiness: Int = 100 {
        didSet {
            hapiness = min(max(hapiness, 0), 100)
            print("hapiness: \(hapiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
    }
    
    func smilenessForFaceView(sender: FaceView) -> Double? {
        return Double(hapiness - 50) / 50
    }
    
}
