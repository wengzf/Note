//
//  FSJSONModel.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/8/22.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSJSONModel : NSObject
{
    NSMutableString *curStr;
    NSInteger curIndex;
}

// json转字典或数组
- (id)objectWithString:(NSString *)string;


@end
