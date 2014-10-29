//
//  APLPositionToBoundsMapping.swift
//  Dynam
//
//  Created by DuyNT on 10/29/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//


import UIKit
import Foundation
protocol ResizableDynamicItem: UIDynamicItem{
    var bounds: CGRect{get set}
}
class APLPositionToBoundsMapping: NSObject{
    var target: UIButton?
    
    required init(target: UIButton){
        super.init()
        self.target = target
    }
    
    func center()-> CGPoint{
        return CGPointMake(self.target!.bounds.size.width, self.target!.bounds.size.height)
    }
    
    func bounds() -> CGRect{
        return self.target!.bounds
    }
    
    func setCenter(center: CGPoint){
        target!.bounds = CGRectMake(0, 0, center.x, center.y)
    }
    
    func transform()-> CGAffineTransform{
        return target!.transform
    }
    
    func setTransform(transform: CGAffineTransform){
        target!.transform = transform
    }
}
