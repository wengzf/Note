//
//  UIViewExtension.swift
//  SkyScanner
//
//  Created by 翁志方 on 16/9/14.
//  Copyright © 2016年 翁志方. All rights reserved.
//

import UIKit


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
    var centerY : CGFloat{
        get{
            return self.top + self.bottom/2
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue - self.top/2
            self.frame = frame;
        }
    }
}

extension UIView{
    func bouceAnimation(_ delay:double_t){
        
        self.transform = CGAffineTransform(scaleX: 0.03, y: 0.03)
        UIView.animate(withDuration: 0.13*1.5, delay: delay, options: UIViewAnimationOptions.curveLinear, animations: {
            self.isHidden = false
            self.transform =  CGAffineTransform(scaleX: 1.164, y: 1.164)
        }) { (flag:Bool) in
            UIView.animate(withDuration: 0.05*1.5, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.transform =  CGAffineTransform(scaleX: 0.91, y: 0.91)
            }) { (flag:Bool) in
                UIView.animate(withDuration: 0.05*1.5, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                    self.transform =  CGAffineTransform.identity
                }) { (flag:Bool) in
                    
                }
            }
        }
    }
}
