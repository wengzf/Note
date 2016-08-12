//
//  FSCurveButton.swift
//  SkyScanner
//
//  Created by 翁志方 on 16/8/12.
//  Copyright © 2016年 翁志方. All rights reserved.
//

import UIKit

enum FSCurveButtonSizeType {
    case Left,Right
}

extension UIView{
    var left : CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame;
        }
    }
    var right : CGFloat{
        get{
           return self.frame.origin.x + self.width
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue - self.width
            self.frame = frame;
        }
    }
    var top : CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame;
        }
    }
    var bottom : CGFloat{
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue - self.height
            self.frame = frame;
        }
    }
    var width : CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame;
        }
        
    }
    var height : CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame;
        }
    }
    var origin : CGPoint{
        get{
            return self.frame.origin
        }
        set{
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame;
        }
    }
    var centerX : CGFloat{
        get{
            return self.left + self.width/2
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue - self.width/2
            self.frame = frame;
        }
    }
    
    
    
}


class FSCurveButton: UIButton {

    var curveButtonSize = FSCurveButtonSizeType.Left;
    var fillColor : UIColor {
        get{
            return UIColor.init(CGColor: shapeLayer.fillColor!)
        }
        set{
            shapeLayer.fillColor = newValue.CGColor
        }
    }
    var shapeLayer = CAShapeLayer()
    
    
    init(frame:CGRect,curveType:FSCurveButtonSizeType) {
        super.init(frame: frame)
        
        let path = CGPathCreateMutable()
        
        let width = frame.size.width
        let height = frame.size.height
        
        var radius = width>height ? height : width
        radius *= 0.3;
        
        if curveType == FSCurveButtonSizeType.Left {
            
            CGPathMoveToPoint(path, nil, 0, height);
            
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
        
        shapeLayer.fillColor = UIColor.redColor().CGColor;
        
        self.layer.addSublayer(shapeLayer);
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    

}
