//
//  FSSurfaceView.m
//  SystemNavigation
//
//  Created by 翁志方 on 16/8/28.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "FSSurfaceView.h"

@implementation FSSurfaceView

// 1=没有实名认证跟联系人


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [[NSBundle mainBundle] loadNibNamed:@"FSSurfaceView" owner:nil options:nil][0];
    
    self.frame = [UIScreen mainScreen].bounds;
    self.contentScrollView.contentSize = CGSizeMake(375, 1200);
    self.readBtn.layer.cornerRadius = self.readBtn.bounds.size.height/2;
    
    originFrame = self.readBtn.frame;
    
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    if (offset.y > 100 && offset.y<150) {
        // 添加
        if (self.readBtn.superview == self) {
            // 根据offset计算当前位置
            CGRect frame = showFrame;
            frame.origin.y -= showOffsetY-offset.y;
            self.readBtn.frame = frame;
            
        }else{
            //
            CGRect frame = [self.readBtn convertRect:self.readBtn.bounds toView:self];
            [self.readBtn removeFromSuperview];
            
            self.readBtn.frame = frame;
            [self addSubview:self.readBtn];
            
            showFrame = frame;
            showOffsetY = offset.y;
        }
    }else if (offset.y <= 100){
        // 保证视图在scrollView上
        if (self.readBtn.superview == self) {
            
//            CGRect frame = [self.readBtn convertRect:self.readBtn.bounds toView:self];
//            [self.readBtn removeFromSuperview];
//            
//            self.readBtn.frame = frame;
//            [self addSubview:self.readBtn];
        }
        
    }else if (offset.y <= 100){
        
    }
    
    
}


@end
