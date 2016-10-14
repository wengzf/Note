//
//  NSObject+Calculator.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/9/5.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CalculatorMaker;


@interface NSObject (Calculator)


+ (int)makeCalculaors:(void(^)(CalculatorMaker *make))calculatorMaker;

@end
