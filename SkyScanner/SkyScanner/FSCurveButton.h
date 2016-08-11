//
//  FSCurveButton.h
//  SkyScanner
//
//  Created by 翁志方 on 16/8/11.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *  天巡的双弧线button
 */

typedef NS_ENUM(NSInteger,FSCurveButtonSize)
{
    kFSCurveButtonSizeRight,
    kFSCurveButtonSizeLeft
};


@interface FSCurveButton : UIButton

@property (nonatomic, assign) FSCurveButtonSize curveButtonSize ;

- (instancetype)initWithFrame:(CGRect)frame curveSize:(FSCurveButtonSize)curveSize;

@end
