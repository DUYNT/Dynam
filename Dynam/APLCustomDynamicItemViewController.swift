//
//  APLCustomDynamicItemViewController.swift
//  Dynam
//
//  Created by DuyNT on 10/29/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//

import UIKit
class APLCustomDynamicItemViewController: UIViewController {
    
    var button1: UIButton!
    var button1Bounds: CGRect?
    var animator: UIDynamicAnimator?
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = self.view.bounds.size
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundTile")!)
        button1 = UIButton(frame: CGRectMake(size.width * 0.5, size.height * 0.5, 100, 30))
        self.view.addSubview(button1)
        button1Bounds = button1.bounds
        button1.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Fill
        button1.contentVerticalAlignment = UIControlContentVerticalAlignment.Fill
    }
    
    @IBAction func click(sender: UIButton){
        button1.bounds = button1Bounds!
        animator = UIDynamicAnimator(referenceView: self.view)
        var buttonBoundsDynamicItem = APLPositionToBoundsMapping(target: sender)
        
    }
    
}
