//
//  APLGravityViewController.swift
//  Dynam
//
//  Created by DuyNT on 10/29/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//

import UIKit

class APLGravityViewController: UIViewController {
    var square1: UIImageView?
    var animator: UIDynamicAnimator?
    override func loadView() {
        super.loadView()
        let size = self.view.bounds.size
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundTile")!)
        
        square1 = UIImageView(image: UIImage(named: "Box1.png"))
        square1?.center = CGPoint(x: size.width * 0.5, y: size.height * 0.2)
        self.view.addSubview(square1!)
        
        var animator = UIDynamicAnimator(referenceView: self.view)
        var gravityBeahvior = UIGravityBehavior(items: [self.square1!])
        animator!.addBehavior(gravityBeahvior)
        self.animator = animator
    }
}
