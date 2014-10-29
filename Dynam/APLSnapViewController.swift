//
//  APLSnapViewController.swift
//  Dynam
//
//  Created by DuyNT on 10/29/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//


import UIKit

class APLSnapViewController: UIViewController {
    var square1: UIImageView?
    var animator: UIDynamicAnimator?
    var snapBehavior: UISnapBehavior?
    override func loadView() {
        super.loadView()
        let size = self.view.bounds.size
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundTile")!)
        square1 = UIImageView(image: UIImage(named: "Box1.png"))
        square1?.center = CGPoint(x: size.width * 0.5, y: size.height * 0.3)
        self.view.addSubview(square1!)
        
        var animator = UIDynamicAnimator(referenceView: self.view)
        let animatorTap = UITapGestureRecognizer(target: self, action: "handleSnapGesture:")
        self.view.addGestureRecognizer(animatorTap)
        self.animator = animator
    }
    
    @IBAction func handleSnapGesture(gesture: UITapGestureRecognizer){
        var point = gesture.locationInView(self.view)
        self.animator!.removeBehavior(self.snapBehavior)
        var snapBehavior = UISnapBehavior(item: self.square1!, snapToPoint: point)
        self.animator!.addBehavior(snapBehavior)
        self.snapBehavior = snapBehavior
    }
    
}
