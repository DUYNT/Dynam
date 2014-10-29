//
//  APLInstantaneousPushViewController.swift
//  Dynam
//
//  Created by DuyNT on 10/29/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//

import UIKit

class APLInstantaneousPushViewController: UIViewController {
    var square1: UIView?
    var animator: UIDynamicAnimator?
    var pushBehavior: UIPushBehavior?
    var attachmentDecorationLayers: NSMutableArray?
    
    override func loadView() {
        super.loadView()
        let size = self.view.bounds.size
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundTile")!)
        
        square1 = UIImageView(image: UIImage(named: "Box1"))
        self.view.addSubview(square1!)
        
        var animator = UIDynamicAnimator(referenceView: self.view)
        var collisionBehavior = UICollisionBehavior(items: [self.square1!])
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsetsMake(self.topLayoutGuide.length, 0, self.bottomLayoutGuide.length, 0))
        animator!.addBehavior(collisionBehavior)
        
        let pushBehavior = UIPushBehavior(items: [self.square1!], mode: UIPushBehaviorMode.Instantaneous)
        pushBehavior.angle = 0.0
        pushBehavior.magnitude = 0.0
        animator!.addBehavior(pushBehavior)
        let gesture = UITapGestureRecognizer(target: self, action: "gesture:")
        self.view.addGestureRecognizer(gesture)
        self.pushBehavior = pushBehavior
        self.animator = animator
    }
    
    func gesture(gesture: UITapGestureRecognizer){
        var p: CGPoint = gesture.locationInView(self.view)
        var o: CGPoint = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))
        var distance: CGFloat = CGFloat(sqrtf(powf(Float(p.x) - Float(o.x), 2.0)+powf(Float(p.y) - Float(o.y), 2.0)))
        var angle: CGFloat = atan2(p.y-o.y, p.x-o.x)
        distance = min(distance, 100.0)
        
        // thieu day
        
        self.pushBehavior!.magnitude = 100.0
        self.pushBehavior!.angle = angle
        self.pushBehavior!.active = true
    }
    
    
}
