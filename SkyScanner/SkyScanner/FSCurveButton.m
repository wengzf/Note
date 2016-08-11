//
//  FSCurveButton.m
//  SkyScanner
//
//  Created by 翁志方 on 16/8/11.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "FSCurveButton.h"

@implementation FSCurveButton

- (instancetype)initWithFrame:(CGRect)frame curveSize:(FSCurveButtonSize)curveSize
{
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor clearColor];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    CGFloat radius = width>height ? height : width;
    radius/=4.5;
    
    if (self.curveButtonSize == kFSCurveButtonSizeLeft) {

        CGPathMoveToPoint(path, nil, 0, height);
        
        CGPathAddArcToPoint(path, nil, 0, 0, width, 0, radius);
        
        CGPathAddLineToPoint(path, nil, width, 0);
        
        CGPathAddArcToPoint(path, nil, width, height, 0, height, radius);
        
        CGPathAddLineToPoint(path, nil, 0, height);
        
    }else{
        
        CGPathMoveToPoint(path, nil, 0, 0);
        
        CGPathAddArcToPoint(path, nil, width, 0, width, height, radius);
        
        CGPathAddLineToPoint(path, nil, 0, height);
        
        CGPathAddArcToPoint(path, nil, 0, 0, width, 0, radius);
        
        CGPathAddLineToPoint(path, nil, 0, height);
    }

    layer.path = path;
    layer.fillColor = [UIColor colorWithWhite:1 alpha:0.8].CGColor;
    
    [self.layer addSublayer:layer];

    return self;
}



@end
