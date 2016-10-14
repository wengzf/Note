//
//  FSLabel.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/6/21.
//  Copyright © 2016年 翁志方. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface FSLabel : UILabel

// 阴影混合范围
@property (nonatomic, assign) CGFloat shadowBlur;

// 内阴影
@property (nonatomic, assign) CGSize innerShadowOffset;
@property (nonatomic, strong) UIColor *innerShadowColor;

// 渐变
@property (nonatomic, strong) UIColor *gradientStartColor;
@property (nonatomic, strong) UIColor *gradientEndColor;
@property (nonatomic, strong)   NSArray *gradientColors;

@property (nonatomic, assign) CGPoint gradientStartPoint;
@property (nonatomic, assign) CGPoint gradientEndPoint;

//
@property (nonatomic, assign) NSUInteger oversampling;

// 内部inset
@property (nonatomic, assign) UIEdgeInsets textInsets;

@end


/* 

 //demonstrate shadow
 label1.shadowColor = nil;
 label1.shadowOffset = CGSizeMake(0.0f, 2.0f);
 label1.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.75f];
 label1.shadowBlur = 5.0f;
 
 //demonstrate inner shadow
 label2.shadowColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
 label2.shadowOffset = CGSizeMake(1.0f, 2.0f);
 label2.shadowBlur = 1.0f;
 label2.innerShadowColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
 label2.innerShadowOffset = CGSizeMake(1.0f, 2.0f);
 
 //demonstrate gradient fill
 label3.gradientStartColor = [UIColor redColor];
 label3.gradientEndColor = [UIColor blackColor];
 
 //demonstrate multi-part gradient
 label4.gradientStartPoint = CGPointMake(0.0f, 0.0f);
 label4.gradientEndPoint = CGPointMake(1.0f, 1.0f);
 label4.gradientColors = [NSArray arrayWithObjects:
 [UIColor redColor],
 [UIColor yellowColor],
 [UIColor greenColor],
 [UIColor cyanColor],
 [UIColor blueColor],
 [UIColor purpleColor],
 [UIColor redColor],
 nil];
 
 //everything
 label5.shadowColor = [UIColor blackColor];
 label5.shadowOffset = CGSizeZero;
 label5.shadowBlur = 20.0f;
 label5.innerShadowColor = [UIColor yellowColor];
 label5.innerShadowOffset = CGSizeMake(1.0f, 2.0f);
 label5.gradientStartColor = [UIColor redColor];
 label5.gradientEndColor = [UIColor yellowColor];
 label5.gradientStartPoint = CGPointMake(0.0f, 0.5f);
 label5.gradientEndPoint = CGPointMake(1.0f, 0.5f);
 label5.oversampling = 2;

*/