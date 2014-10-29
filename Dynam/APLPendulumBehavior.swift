//
//  APLPendulumBehavior.swift
//  Dynam
//
//  Created by DuyNT on 10/29/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//


import UIKit

class APLPendulumBehavior: UIDynamicBehavior {
    var animator: UIView?
    var draggingBehavior: UIAttachmentBehavior?
    var pushBehavior: UIPushBehavior?
    
    required init(item: UIDynamicItem, p:CGPoint){
        super.init()
        //Các hành vi con lắc cao cấp được xây dựng từ 2 hành vi nguyên thủy.
        
        var gravityBehavior = UIGravityBehavior(items: [item])
        var attachmentBehavior = UIAttachmentBehavior(item: item, attachedToAnchor: p)
        
        //Những hành vi primative cho phép người dùng kéo trọng lượng con lắc.
        
        var draggingBehavior = UIAttachmentBehavior(item: item, attachedToAnchor: CGPointZero)
        var pushBehavior = UIPushBehavior(items: [item], mode: UIPushBehaviorMode.Instantaneous)
        
        pushBehavior.active = false
        
        
    }
}
