//
//  ViewController.m
//  SystemNavigation
//
//  Created by 翁志方 on 16/5/12.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "ViewController.h"
#import "FSPopMenu.h"
#import "FSRefreshView.h"


#import "FSJSONModel.h"

#import "NSObject+FSKeyValue.h"
#import "FSSurfaceView.h"

#import "NSObject+Calculator.h"
//#import "CaculatorManager.h"
#import "CalculatorMaker.h"

#import "VSCOAnimation.h"

typedef enum {
    SexMale,
    SexFemale
} Sex;

@interface School : NSObject

@property (copy, nonatomic) NSString *schoolName;

@end
@implementation School

@end



@interface User : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) unsigned int age;
@property (copy, nonatomic) NSString *height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;
@property (assign, nonatomic, getter=isGay) BOOL gay;


@property (strong, nonatomic) School *school;

@property (strong, nonatomic) NSDictionary *dic;

@property (strong, nonatomic) NSMutableArray *arr;

- (void)fun;
- (id)funid;

@end

@implementation User

@end



@interface ViewController ()
{
    UIButton *btn1;
    UIButton *btn2;
}
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;

@property (weak, nonatomic) IBOutlet UIImageView *whiteBackImgView;

//播放器视图控制器
@property (nonatomic,strong) MPMoviePlayerViewController *moviePlayerViewController;


- (IBAction)btnClked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    

    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),
                           @"gay" : @"true",
                           @"school" : @{
                               @"schoolName" : @"FJNU"
                           }
                           };
    
    // JSON -> User
    User *user = [User fs_objectWithDic:dict];
    
    NSLog(@"name=%@, icon=%@, age=%zd, height=%@, money=%@, sex=%d, gay=%d", user.name, user.icon, user.age, user.height, user.money, user.sex, user.gay);
    
//    FSSurfaceView *sv = [[FSSurfaceView alloc] initWithFrame:CGRectZero];
//    [[UIApplication sharedApplication].keyWindow addSubview:sv];
//
//    int result = [NSObject makeCalculaors:^(CalculatorMaker *make) {
//    
//        make.add(1).add(1).add(1).add(1).add(1);
//    }];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
//    self.btn.layer.cornerRadius = 37;
//    self.view.backgroundColor = [UIColor whiteColor];

//    FSRefreshView *view = [[FSRefreshView alloc] init];
//    [self.view addSubview:view];
//    [view startAnimation];
    
    btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, 375, 60)];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(btn1Clk) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    [self btn1Clk];
    
    
}

- (void)btn1Clk
{
    static VSCOAnimation *view;
    
    if (view.superview) {
        [view removeFromSuperview];
        view = nil;
    }
    
    view = [[VSCOAnimation alloc] initWithFrame:self.view.frame];
    [self.view insertSubview:view belowSubview:btn1];
    
    [view startAnimation];
}
- (void)viewDidAppear:(BOOL)animated
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClked:(id)sender {

}


-(void)dealloc{

}


- (IBAction)editChange:(id)sender {
    
    static NSString *preStr;
    
    NSString *str = self.aTextField.text;
    
    if (preStr.length > str.length) {
        NSString *ts = [preStr substringFromIndex:preStr.length-1];
        if ([ts isEqualToString:@" "]) {
            str = [str substringToIndex:str.length-1];
        }
    }
    
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (str.length > 0){
        self.aTextField.font = [UIFont systemFontOfSize:50];
    }else{
        self.aTextField.font = [UIFont systemFontOfSize:18];
    }
    
    NSMutableString *tmpStr = [NSMutableString new];
    
    if (str.length < 3) {
        [tmpStr appendString:str];
    }else{
        [tmpStr appendString:[str substringToIndex:3]];
        [tmpStr appendString:@" "];
        
        if (str.length < 7) {
            [tmpStr appendString:[str substringWithRange:NSMakeRange(3, str.length-3)]];
        }else{
            [tmpStr appendString:[str substringWithRange:NSMakeRange(3, 4)]];
            [tmpStr appendString:@" "];
            
            [tmpStr appendString:[str substringWithRange:NSMakeRange(7, str.length-7)]];
        }
    }

    self.aTextField.text = tmpStr;
    preStr = tmpStr;
}


@end





























