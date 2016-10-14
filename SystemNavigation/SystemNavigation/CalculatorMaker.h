//
//  CalculatorMaker.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/9/5.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorMaker : NSObject


@property (nonatomic, assign) int result;


- (CalculatorMaker *(^)(int))add;

- (CalculatorMaker *(^)(int))sub;

- (CalculatorMaker *(^)(int))mul;

- (CalculatorMaker *(^)(int))div;



@end
