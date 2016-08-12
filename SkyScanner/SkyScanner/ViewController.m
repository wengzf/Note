//
//  ViewController.m
//  SkyScanner
//
//  Created by 翁志方 on 16/8/11.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "ViewController.h"
#import "FSCurveButton.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    FSCurveButton *btn = [[FSCurveButton alloc] initWithFrame:CGRectMake(100, 100, 100, 162) curveSize:kFSCurveButtonSizeRight];
    
//    FSCurveButton *btn = [[FSCurveButton alloc] initWithFrame:CGRectMake(100, 100, 100, 162) curveSize:kFSCurveButtonSizeLeft];
    
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
