//
//  ViewController.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/5/12.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


// .m
#import <sys/sysctl.h>


@interface UIDevice (ProcessesAdditions)
- (NSArray *)runningProcesses;
@end


@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *aTextField;















@end
















