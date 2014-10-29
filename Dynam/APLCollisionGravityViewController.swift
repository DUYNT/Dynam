//
//  APLCollisionGravityViewController.swift
//  Dynam
//
//  Created by DuyNT on 10/29/14.
//  Copyright (c) 2014 DuyNT. All rights reserved.
//

import UIKit

class APLCollisionGravityViewController: UIViewController {
    
    var animator: UIDynamicAnimator?
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    
    var maxX: CGFloat = 0
    var maxY: CGFloat = 0
    let boxSize: CGFloat = 30
    var box = UIView()
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundTile")!)
        let size = self.view.bounds.size
        self.edgesForExtendedLayout = UIRectEdge.None
        configureDynamicKit()
        
        box = UIImageView(image: UIImage(named: "Box1"))
        box.center = CGPoint(x: size.width * 0.5, y: 0)
        self.view.addSubview(box)
        self.addBoxToPhysic()
        //Trễ 1 giây rồi mới chạy.
        //Câu hỏi: khác gì với NSThread.sleep() ?
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(),{
        //            self.addBoxToPhysic()
        //        })
    }
    
    func configureDynamicKit() {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        gravity.gravityDirection = CGVectorMake(0.0, 0.8) //Thử đổi giá trị x, y của vector xem kết quả thế nào
        animator!.addBehavior(gravity)
        
        collider.translatesReferenceBoundsIntoBoundary = true  //Chuyển reference thành khung để giới hạn chuyển động
        animator!.addBehavior(collider)
    }
    
    func addBoxToPhysic() {
        collider.addItem(box)  //Không có lệnh này, box không va chạm
        
        gravity.addItem(box) //Không có lệnh này, box không rơi
    }
    
}
