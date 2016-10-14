//
//  FSTickerLabel.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/6/21.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    FSTickerLabelScrollDirectionUp = 1,
    FSTickerLabelScrollDirectionDown = 2
}FSTickerLabelScrollDirection;

@interface FSTickerLabel : UIView

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;

/*
 Default 8 px
 */
@property (nonatomic, unsafe_unretained) float characterWidth;

/*
 Frame may have been changed after setting new text
 */
@property (nonatomic, strong) NSString *text;

/*
 Change text animation duration in seconds
 Default 1 seconds
 */
@property (nonatomic, unsafe_unretained) float changeTextAnimationDuration;

/*
 Default FSTickerLabelScrollDirectionUp
 */
@property (nonatomic, unsafe_unretained) FSTickerLabelScrollDirection scrollDirection;

/*
 Default nil
 */
@property (nonatomic, strong) UIColor *shadowColor;

/*
 Default CGSizeMake(0, 0)
 */
@property (nonatomic, unsafe_unretained) CGSize shadowOffset;

@end

/*
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentIndex = 0;
    self.numbersArray = @[@1, @29, @1098, @89, @18741984, @897];
    
    UIFont *font = [UIFont boldSystemFontOfSize: 30];
    
    self.tickerLabel = [[ADTickerLabel alloc] initWithFrame: CGRectMake(180, 50, 0, font.lineHeight)];
    self.tickerLabel.font = font;
    self.tickerLabel.characterWidth = 22;
    self.tickerLabel.changeTextAnimationDuration = 0.5;
    [self.view addSubview: self.tickerLabel];
}
- (IBAction)buttonClicked:(id)sender{
    
    self.tickerLabel.text = [NSString stringWithFormat:@"%@", self.numbersArray[self.currentIndex]];
    
    self.currentIndex++;
    if(self.currentIndex == [self.numbersArray count]) self.currentIndex = 0;
}

*/



