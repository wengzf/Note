//
//  VSCOAnimation.m
//  SystemNavigation
//
//  Created by 翁志方 on 2016/10/14.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "VSCOAnimation.h"

@implementation VSCOAnimation

- (void)startAnimation
{
    // 正方形出现
    {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, nil, CGRectMake(44, 128, 232, 232));
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.strokeColor = [UIColor lightGrayColor].CGColor;
        layer.fillMode = kCAFillModeBoth;
        [self.layer addSublayer:layer];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
        animation.fromValue = @2;
        animation.toValue = @10;
        animation.duration = 2;
        animation.fillMode = kCAFillModeBoth;
        
        animation.removedOnCompletion = NO;
        [layer addAnimation:animation forKey:nil];
        
//        CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
//        animation2.fromValue = [UIColor lightGrayColor];
//        animation2.toValue = [UIColor blackColor];
//        animation2.duration = 2;
//        [layer addAnimation:animation2 forKey:nil];
//        
    }
    
    
    
}

@end
