//
//  ViewController.m
//  Thunder
//
//  Created by 翁志方 on 2016/10/25.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "ViewController.h"
#import "ThunderMap.h"

@interface ViewController ()
{
    ThunderMap *thunder;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    thunder = [ThunderMap new];
    
    [thunder generateMapWithSize:9 thunderNum:10];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
