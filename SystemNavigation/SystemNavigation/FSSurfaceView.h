//
//  FSSurfaceView.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/8/28.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSSurfaceView : UIView<UIScrollViewDelegate>
{
    CGFloat showOffsetY;
    CGRect showFrame;
    
    CGRect originFrame;
}


@property (strong, nonatomic) IBOutlet UIButton *readBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;



@end
