//
//  APLItemPropertiesViewController.swift
//  Dynam
//
//  Created by DuyNT on 10/29/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//

import UIKit

class APLItemPropertiesViewController: UIViewController {
    var square1: UIView?
    var square2: UIView?
    var square1PropertiesBehavior: UIDynamicItemBehavior?
    var square2PropertiesBehavior: UIDynamicItemBehavior?
    var animator: UIDynamicAnimator?
    override func loadView() {
        super.loadView()
        let size = self.view.bounds.size
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundTile")!)
        square1 = UIImageView(image: UIImage(named: "Box1"))
        self.view.addSubview(square1!)
        self.square1?.center = CGPointMake(90, 171)
        square2 = UIImageView(image: UIImage(named: "Box1"))
        self.view.addSubview(square2!)
        self.square2?.center = CGPointMake(230, 171)
        // button retry
        var button = UIBarButtonItem(title: "Retry", style: .Plain, target: self, action: "replayAction:")
        self.navigationItem.rightBarButtonItem = button
        
        var animator = UIDynamicAnimator(referenceView: self.view)
        var gravityBeahvior = UIGravityBehavior(items: [self.square1!, self.square2!])
        var collisionBehavior = UICollisionBehavior(items: [self.square1!, self.square2!])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        self.square2PropertiesBehavior = UIDynamicItemBehavior(items: [self.square2!])
        self.square2PropertiesBehavior?.elasticity = 0.5
        
        self.square1PropertiesBehavior = UIDynamicItemBehavior(items: [self.square1!])
        animator!.addBehavior(self.square1PropertiesBehavior)
        animator!.addBehavior(self.square2PropertiesBehavior)
        animator!.addBehavior(gravityBeahvior)
        animator!.addBehavior(collisionBehavior)
        self.animator = animator
    }
    
    @IBAction func replayAction(sender: UIBarButtonItem){
        self.square1PropertiesBehavior!.addLinearVelocity(CGPointMake(0, -1 * self.square1PropertiesBehavior!.linearVelocityForItem(self.square1!).y), forItem: self.square1!)
        self.square1?.center = CGPointMake(90, 171)
        self.animator!.updateItemUsingCurrentState(self.square1!)
        self.square2PropertiesBehavior!.addLinearVelocity(CGPointMake(0, -1 * self.square2PropertiesBehavior!.linearVelocityForItem(self.square2!).y), forItem: self.square2!)
        self.square2?.center = CGPointMake(230, 171)
        self.animator!.updateItemUsingCurrentState(self.square2!)
    }
}
