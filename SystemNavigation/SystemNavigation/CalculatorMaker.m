//
//  CalculatorMaker.m
//  SystemNavigation
//
//  Created by 翁志方 on 16/9/5.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker


- (CalculatorMaker *(^)(int))add
{
    return ^CalculatorMaker *(int value){
        self.result += value;
        return self;
    };
}



//- (CalculatorMaker *(^)(int))sub;
//
//- (CalculatorMaker *(^)(int))mul;
//
//- (CalculatorMaker *(^)(int))div;

@end
