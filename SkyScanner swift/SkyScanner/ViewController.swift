//
//  ViewController.swift
//  SkyScanner
//
//  Created by 翁志方 on 16/8/12.
//  Copyright © 2016年 翁志方. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var curImage = UIImage()
    
    var imgView1 = UIImageView.init(frame: UIScreen.main.bounds)
    var imgView2 = UIImageView.init(frame: UIScreen.main.bounds)
    
    var curveButtons : [FSCurveButton] = Array()
    
    var curveBtn0 : FSCurveButton!
    var curveBtn1 : FSCurveButton!
    var curveBtn2 : FSCurveButton!
    var curveBtn3 : FSCurveButton!
    var curveBtn4 : FSCurveButton!
    var curveBtn5 : FSCurveButton!
    var curveBtn6 : FSCurveButton!
    var curveBtn7 : FSCurveButton!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加背景图案，随机从准备好的三张图片中选取
        let num = Int(arc4random()%8)
        let str = "\(num).jpg"
        curImage = UIImage.init(named: str)!
        imgView2.image = curImage
        self.view.addSubview(imgView2)
        
        imgView1.image = curImage
        self.view.addSubview(imgView1)
        
        // 添加按钮
        self.curveButtonInit()
        
        // 更换背景定时器
        let timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(ViewController.timerAction) , userInfo: nil, repeats: true)
        timer.fire()

        
        // 添加动画
    }
    
    
    func timerAction()
    {
        count += 1
        count &= 7
        let str = "\(count).jpg"
    
//        curImage = UIImage.init(named: str)!
//
//        imgView2 .removeFromSuperview()
//        self.view .insertSubview(imgView2, aboveSubview: imgView1)
//        
//        imgView2.alpha = 0
//        imgView2.image = curImage
//        
//        UIView.animateWithDuration(5, delay: 0, options: .CurveLinear, animations: {
//            self.imgView1.alpha = 0.3
//            self.imgView2.alpha = 1
//        }) { (flag : Bool) in
//            self.imgView1.image = self.curImage
//            
//            let tmp = self.imgView2
//            self.imgView2 = self.imgView1
//            self.imgView1 = tmp
//        }
        
        self.startAnimation()
    }
    
    func curveButtonInit()
    {
        self.curveBtn0 = FSCurveButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 162), curveType: FSCurveButtonSizeType.right)
        self.curveBtn0.origin = CGPoint(x: 90,y: 150)
        self.curveBtn0.fillColor = UIColor.init(white: 1, alpha: 1)
        self.view.addSubview(self.curveBtn0)
        
        
        self.curveBtn1 = FSCurveButton.init(frame: CGRect(x: 0, y: 0, width: 74, height: 128), curveType: FSCurveButtonSizeType.left)
        self.curveBtn1.top = self.curveBtn0.bottom
        self.curveBtn1.right = self.curveBtn0.right
        
        self.curveBtn1.fillColor = UIColor.init(white: 1, alpha: 0.95)
        self.view.addSubview(self.curveBtn1)
        
        
        self.curveBtn2 = FSCurveButton.init(frame: CGRect(x: 0, y: 0, width: 74, height: 128 ), curveType: FSCurveButtonSizeType.left)
        self.curveBtn2.left = self.curveBtn0.right
        self.curveBtn2.bottom = self.curveBtn0.bottom
        self.curveBtn2.fillColor = UIColor.init(white: 1, alpha: 0.9)
        self.view.addSubview(self.curveBtn2)
        
        
        self.curveBtn3 = FSCurveButton.init(frame: CGRect(x: 0, y: 0, width: 62, height: 108), curveType:
            FSCurveButtonSizeType.right)
        self.curveBtn3.top = self.curveBtn0.bottom
        self.curveBtn3.left = self.curveBtn0.right
        self.curveBtn3.fillColor = UIColor.init(white: 1, alpha:0.85)
        self.view.addSubview(self.curveBtn3)
        
        
        
        self.curveBtn4 = FSCurveButton.init(frame: CGRect(x: 0, y: 0, width: 45, height: 64), curveType: FSCurveButtonSizeType.left)
        self.curveBtn4.top = self.curveBtn0.top
        self.curveBtn4.right = self.curveBtn0.left
        self.curveBtn4.fillColor = UIColor.init(white: 1, alpha:0.8 )
        self.view.addSubview(self.curveBtn4)
        
        
        self.curveBtn5 = FSCurveButton.init(frame: CGRect(x: 0, y: 0, width: 36, height: 50), curveType: FSCurveButtonSizeType.right)
        self.curveBtn5.bottom = self.curveBtn0.top
        self.curveBtn5.right = self.curveBtn0.left
        self.curveBtn5.fillColor = UIColor.init(white: 1, alpha:0.75 )
        self.view.addSubview(self.curveBtn5)
        
        
        self.curveBtn6 = FSCurveButton.init(frame: CGRect(x: 0, y: 0, width: 52, height: 25), curveType: FSCurveButtonSizeType.left)
        self.curveBtn6.bottom = self.curveBtn0.top
        self.curveBtn6.left = self.curveBtn0.left
        self.curveBtn6.fillColor = UIColor.init(white: 1, alpha:0.7 )
        self.view.addSubview(self.curveBtn6)
    }
    
    func startAnimation(){
        var animationDelay = 0.0
        
        self.curveBtn0.isHidden = true
        self.curveBtn1.isHidden = true
        self.curveBtn2.isHidden = true
        self.curveBtn3.isHidden = true
        self.curveBtn4.isHidden = true
        self.curveBtn5.alpha = 0
        self.curveBtn6.alpha = 0
        
        self.curveBtn0.bouceAnimation(0)

        
        
        animationDelay += 0.12
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + animationDelay) {
            
            self.curveBtn1.bouceAnimation(0)
        }
        
        animationDelay += 0.07
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + animationDelay) {
            
            self.curveBtn3.bouceAnimation(0)
        }
        
        animationDelay += 0.03
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + animationDelay) {
            
            self.curveBtn2.bouceAnimation(0)
        }
        
        animationDelay += 0.04
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + animationDelay) {
            
            self.curveBtn4.bouceAnimation(0)
        }
        
        animationDelay += 0.18
        UIView.animate(withDuration: 0.1, delay: animationDelay, options: UIViewAnimationOptions(), animations: {
            self.curveBtn5.alpha = 0.7
            }, completion: nil)
        
        
        animationDelay += 0.10
        
        UIView.animate(withDuration: 0.1, delay: animationDelay, options: UIViewAnimationOptions(), animations: {
            self.curveBtn6.alpha = 0.8
            }, completion: nil)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

