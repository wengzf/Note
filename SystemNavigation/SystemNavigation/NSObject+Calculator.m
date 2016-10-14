//
//  NSObject+Calculator.m
//  SystemNavigation
//
//  Created by 翁志方 on 16/9/5.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "NSObject+Calculator.h"
#import "CalculatorMaker.h"

@implementation NSObject (Calculator)

+ (int)makeCalculaors:(void(^)(CalculatorMaker *make))calculatorMaker
{
    CalculatorMaker *mgr = [CalculatorMaker new];
    
    calculatorMaker(mgr);
    
    return mgr.result;
}


@end

