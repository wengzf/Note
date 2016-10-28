//
//  ThunderMap.h
//  Thunder
//
//  Created by 翁志方 on 2016/10/25.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThunderMap : NSObject
{
    int map[100][100];
}


- (void) generateMapWithSize:(NSInteger)size thunderNum:(NSInteger) num;


@end
