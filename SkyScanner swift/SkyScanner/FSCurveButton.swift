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
    
    init(frame:CGRect,curveType:FSCurveButtonSizeType) {
        super.init(frame: frame)
        
        let path = CGMutablePath()
        
        let width = frame.size.width
        let height = frame.size.height
        
        var radius = width>height ? height : width
        radius *= 0.3;
        
        if curveType == FSCurveButtonSizeType.left {
        
            path.move(to: CGPoint.init(x: 0, y: height))
            
            path.addArc(tangent1End: CGPoint.init(x: 0, y: 0), tangent2End:  CGPoint.init(x: width, y: 0), radius: radius)
            
            path.addLine(to: CGPoint.init(x: width, y: 0))
            
            path.addArc(tangent1End: CGPoint.init(x: width, y: height), tangent2End:  CGPoint.init(x: 0, y: height), radius: radius)
            
            path.addLine(to: CGPoint.init(x: 0, y: height))
            
        }else{
            
            path.move(to: CGPoint.init(x: 0, y: 0))
            
            path.addArc(tangent1End: CGPoint.init(x: width, y: 0), tangent2End:  CGPoint.init(x: width, y: height), radius: radius)
            
            
            path.addLine(to: CGPoint.init(x: width, y: height))
            
            path.addArc(tangent1End: CGPoint.init(x: 0, y: height), tangent2End:  CGPoint.init(x: 0, y: 0), radius: radius)
            
            path.addLine(to: CGPoint.init(x: 0, y: 0))

        }
        
        shapeLayer.path = path;
        
        shapeLayer.fillColor = UIColor.red.cgColor;
        
        self.layer.addSublayer(shapeLayer);
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    

}
