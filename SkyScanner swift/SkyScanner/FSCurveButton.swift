//
//  FSCurveButton.swift
//  SkyScanner
//
//  Created by 翁志方 on 16/8/12.
//  Copyright © 2016年 翁志方. All rights reserved.
//

import UIKit

enum FSCurveButtonSizeType {
    case left,right
}


class FSCurveButton: UIButton {

    var curveButtonSize = FSCurveButtonSizeType.left;
    var fillColor : UIColor {
        get{
            return UIColor.init(cgColor: shapeLayer.fillColor!)
        }
        set{
            shapeLayer.fillColor = newValue.cgColor
            
            
        }
    }
    var shapeLayer = CAShapeLayer()
    /Users/wengzhifang/Desktop/Note/SkyScanner swift/SkyScanner/FSCurveButton.swift:48:39: Nil is not compatible with expected argument type 'UnsafePointer<CGAffineTransform>'/Users/wengzhifang/Desktop/Note/SkyScanner swift/SkyScanner/FSCurveButton.swift:48:39: Nil is not compatible with expected argument type 'UnsafePointer<CGAffineTransform>'
    
    init(frame:CGRect,curveType:FSCurveButtonSizeType) {
        super.init(frame: frame)
        
        let path = CGMutablePath()
        
        let width = frame.size.width
        let height = frame.size.height
        
        var radius = width>height ? height : width
        radius *= 0.3;
        
        if curveType == FSCurveButtonSizeType.left {
        
            CGPathMoveToPoint(path, nil)
            
            
            CGPathMoveToPoint(path, Nil, 0, height);
            
            CGPathAddArcToPoint(path, nil, 0, 0, width, 0, radius);
            
            CGPathAddLineToPoint(path, nil, width, 0) ;
            
            CGPathAddArcToPoint(path, nil, width, height, 0, height, radius);
            
            CGPathAddLineToPoint(path, nil, 0, height);
            
        }else{
            
            CGPathMoveToPoint(path, nil, 0, 0);
            
            CGPathAddArcToPoint(path, nil, width, 0, width, height, radius);
            
            CGPathAddLineToPoint(path, nil, width, height);
            
            CGPathAddArcToPoint(path, nil, 0, height, 0, 0, radius);
            
            CGPathAddLineToPoint(path, nil, 0, 0);
        }
        
        shapeLayer.path = path;
        
        shapeLayer.fillColor = UIColor.red.cgColor;
        
        self.layer.addSublayer(shapeLayer);
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    

}
