//
//  FSRefreshView.m
//  SystemNavigation
//
//  Created by 翁志方 on 16/6/1.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "FSRefreshView.h"



#define UIColorWithHex(x) RGB(((x)&0xFF0000) >> 16, ((x)&0xFF00) >> 8 ,  ((x)&0xFF))

#define ClickNumber @0

//navbar的背景颜色
#define kMainBarBgColor ([UIColor clearColor])//5A21C2
#define kMeBarBgColor  (UIColorWithHex(0xFFFFFF))

//颜色
#define RGB(r,g,b)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define HELP_URL       @"http://renwohua.com/help"

//查看违约后果h5页面
#define VIOLATE_URL       @"h5/violate"


#define GRAY(x) RGB((x),(x),(x))
#define DeviderColor GRAY(224)

#define UIColor33 UIColorWithHex(0x333333)
#define UIColor66 UIColorWithHex(0x666666)
#define UIColor99 UIColorWithHex(0x999999)
#define UIColorCC UIColorWithHex(0xcccccc)

#define LMSSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define mainBtnColor UIColorWithHex(0xf98435)

/* 字号大小处理 */
#define HelveticaNeueLightFont(fontSize)    [UIFont fontWithName:@"HelveticaNeue-Light" size:(fontSize)]

#define LMSNotificationCenter [NSNotificationCenter defaultCenter]


//屏幕尺寸
#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

#define OnePixelWidth  (ScreenWidth == 414 ? 0.334 : 0.5)


@interface FSRefreshView()
{
    UIView *rectView;
    
    UIView *line1;
    UIView *line2;
    UIView *line3;
    
    UIView *line4;
    UIView *line5;
    UIView *line6;
}

@end

@implementation FSRefreshView

- (instancetype)init
{
    self = [self initWithFrame:CGRectMake(100, 100, 25, 25)];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self.layer.cornerRadius = 7;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.backgroundColor = [UIColor clearColor];

    rectView = [[UIView alloc] initWithFrame:CGRectMake(4, 4, 7, 7)];
    rectView.backgroundColor = [UIColor colorWithWhite:230/255.0 alpha:1.0];
    rectView.layer.borderColor = [UIColor colorWithWhite:164/255.0 alpha:1.0].CGColor;
    rectView.layer.borderWidth = OnePixelWidth;
    
    line1 = [self lineViewWithRect:CGRectMake(14, 4, 7, 0.5)];
    line2 = [self lineViewWithRect:CGRectMake(14, 7, 7, 0.5)];
    line3 = [self lineViewWithRect:CGRectMake(14, 10, 7, 0.5)];
    
    line4 = [self lineViewWithRect:CGRectMake(4, 13, 17, 0.5)];
    line5 = [self lineViewWithRect:CGRectMake(4, 16, 17, 0.5)];
    line6 = [self lineViewWithRect:CGRectMake(4, 19, 17, 0.5)];
    
    [self  addSubview:rectView ];
    [self  addSubview:line1 ];
    [self  addSubview:line2 ];
    [self  addSubview:line3 ];
    [self  addSubview:line4 ];
    [self  addSubview:line5 ];
    [self  addSubview:line6 ];
    
    return self;
}
- (UIView *)lineViewWithRect:(CGRect)frame
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.layer.shadowColor = [UIColor redColor].CGColor;
//    line.layer.shadowRadius = 2;
    line.layer.shadowOffset = CGSizeMake(1, 1);
    line.backgroundColor = [UIColor colorWithWhite:164/255.0 alpha:1.0];
    return line;
}

- (void)startAnimation
{
    CGFloat duration = 0.2;
    CGFloat delay = 0.2;
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
        rectView.frame = CGRectMake(14, 4, 7, 7);
        
        line1.frame = CGRectMake(4, 13, 17, 0.5);
        line2.frame = CGRectMake(4, 16, 17, 0.5);
        line3.frame = CGRectMake(4, 19, 17, 0.5);
        
        line4.frame = CGRectMake(4, 5, 7, 0.5);
        line5.frame = CGRectMake(4, 7, 7, 0.5);
        line6.frame = CGRectMake(4, 10, 7, 0.5);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            rectView.frame = CGRectMake(14, 14, 7, 7);
            
            line1.frame = CGRectMake(4, 13, 7, 0.5);
            line2.frame = CGRectMake(4, 16, 7, 0.5);
            line3.frame = CGRectMake(4, 19, 7, 0.5);
            
            line4.frame = CGRectMake(4, 4, 17, 0.5);
            line5.frame = CGRectMake(4, 7, 17, 0.5);
            line6.frame = CGRectMake(4, 10, 17, 0.5);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
                rectView.frame = CGRectMake(4, 14, 7, 7);
                
                line1.frame = CGRectMake(4, 4, 17, 0.5);
                line2.frame = CGRectMake(4, 7, 17, 0.5);
                line3.frame = CGRectMake(4, 10, 17, 0.5);
                
                line4.frame = CGRectMake(14, 13, 7, 0.5);
                line5.frame = CGRectMake(14, 16, 7, 0.5);
                line6.frame = CGRectMake(14, 19, 7, 0.5);
                
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    rectView.frame = CGRectMake(4, 4, 7, 7);
                    
                    line1.frame = CGRectMake(14, 4, 7, 0.5);
                    line2.frame = CGRectMake(14, 7, 7, 0.5);
                    line3.frame = CGRectMake(14, 10, 7, 0.5);;
                    
                    line4.frame = CGRectMake(4, 13, 17, 0.5);
                    line5.frame = CGRectMake(4, 16, 17, 0.5);
                    line6.frame = CGRectMake(4, 19, 17, 0.5);
                    
                } completion:^(BOOL finished) {
                    [self startAnimation];
                }];
            }];
        }];
    }];
}
- (void)stopAnimation
{
    
}


@end
