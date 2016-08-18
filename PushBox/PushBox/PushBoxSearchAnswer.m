//
//  PushBoxSearchAnswer.m
//  PushBox
//
//  Created by 翁志方 on 16/6/3.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "PushBoxSearchAnswer.h"


const int mapCount = 6;

@implementation StateUnit

- (instancetype)init
{
    self = [super init];
    self.mpArr = [NSMutableArray arrayWithCapacity:mapCount];

    return self;
}

- (NSString *)keyStr
{
    if (_keyStr) {
        return _keyStr;
    }
    
    NSMutableString *str = [NSMutableString string];
    
    for (int i=0; i<mapCount; ++i) {
        for (int j=0; j<mapCount; j+=2) {
            char cstr[2];
            cstr[0] = [self.mpArr[i][j] intValue] + [self.mpArr[i][j+1] intValue];
            cstr[1] = 0;
            NSString *tmp = [NSString stringWithCString:cstr encoding:NSUTF8StringEncoding];
            [str appendString:tmp];
        }
    }
    _keyStr = str;
    return str;
}

- (StateUnit *)nextStateWithDir:(int [2])dir
{
    StateUnit *obj = [StateUnit new];
    
    // 检查是否合法的移动
    NSInteger posx = self.posx + dir[0];
    NSInteger posy = self.posy + dir[1];
    
//    8 = 障碍物
//    4 = 目标
//    2 = 箱子
//    1 = 人
    int val = [self.mpArr[posx][posy] intValue];
    if (val&8) {
        // 是障碍物 无法移动
        return nil;
    }else if (val&2) {
        // 是箱子
        NSInteger nextx = posx + dir[0];
        NSInteger nexty = posx + dir[1];
        int tmp = [self.mpArr[nextx][nexty] intValue];
        if ((tmp&2) || (tmp&8) ) {
            // 无法移动
            return nil;
        }else{
            // 返回推动箱子
            for (int i=0; i<mapCount; ++i) {
                obj.mpArr[i] = [self.mpArr[i] mutableCopy];
            }
            int tt = [obj.mpArr[self.posx][self.posy] intValue];
            obj.mpArr[self.posx][self.posy] = @(tt^1);
            
            obj.mpArr[posx][posy] = @(val^1);
            
            self.mpArr[nextx][nexty] = @(tmp^2);
            
            obj.posx = posx;
            obj.posy = posy;
        }
    }else{
        // 是空位置 移动
        for (int i=0; i<mapCount; ++i) {
            obj.mpArr[i] = [self.mpArr[i] mutableCopy];
        }
        int tt = [obj.mpArr[self.posx][self.posy] intValue];
        obj.mpArr[self.posx][self.posy] = @(tt^1);
        
        obj.mpArr[posx][posy] = @(val^1);
        
        obj.posx = posx;
        obj.posy = posy;
    }

    return obj;
}
- (BOOL)checkDestination
{
    for (int i=0; i<mapCount; ++i) {
        for (int j=0; j<mapCount; j++) {
            int val = [self.mpArr[i][j] intValue];
            if ((val&4)!=0 && (val&2)==0) {
                return NO;
            }
        }
    }
    return YES;
}

@end



@implementation PushBoxSearchAnswer

-(instancetype)init
{
    self = [super init];
    

    return self;
}

-(void)searchInit
{
    checkedDic = [NSMutableDictionary dictionary];
    stateArr = [NSMutableArray array];
    
    StateUnit *obj = [StateUnit new];


    int mp[mapCount][mapCount] = {{8, 8, 8, 8, 8, 8},
                    {8, 1, 0, 0, 0, 8},
                    {8, 0, 2, 0, 0, 8},
                    {8, 0, 0, 0, 0, 8},
                    {8, 0, 0, 0, 4, 8},
                    {8, 8, 8, 8, 8, 8}
    };
    for (int i=0; i<mapCount; ++i) {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:8];
        for (int j=0; j<mapCount; j++) {
            [arr addObject:@(mp[i][j])];
        }
        obj.mpArr[i] = arr;
    }
    obj.posx = 1;
    obj.posy = 1;
    
    [stateArr addObject:obj];
}

- (void)searchAns
{
    int dir[4][2] ={{-1, 0}, {0, -1}, {0, 1},};        // 左上右下
    
    // 加入初始状态
    NSInteger stateIndex = 0;
    BOOL flag = YES;
    while (stateIndex < stateArr.count && flag) {

        if (stateIndex > 10000){
            
        }
        StateUnit *obj = stateArr[stateIndex];
        
        // 枚举4个方向的移动
        for (int i=0; i<4; ++i){
            StateUnit *tmp = [obj nextStateWithDir:dir[i]];
            if (tmp){
                if ([tmp checkDestination]) {
                    // 输出结果
                    checkedDic[[tmp keyStr]]  = @1;
                    tmp.preIndex = stateIndex;
                    tmp.operation = i;
                    [stateArr addObject:tmp];
                    
                    NSMutableArray *arr = [NSMutableArray array];
                    [arr addObject:@(i)];
                    NSInteger index = stateIndex;
                    while (index) {
                        StateUnit *tmpObj = stateArr[index];
                        [arr addObject:@(tmpObj.operation)];
                        index = tmpObj.preIndex;
                    }
                    [self outputAnsWithArr:arr];
                    
                    flag = NO;
                    break;
                }else{
                    // 检查状态是否被展开过
                    
                    if ([checkedDic[[tmp keyStr]] intValue] == 0) {
                        checkedDic[[tmp keyStr]]  = @1;
                        tmp.preIndex = stateIndex;
                        tmp.operation = i;
                        [stateArr addObject:tmp];
                        
                    }
                }
            }
        }
        
        stateIndex++;
    }
}

- (void)outputAnsWithArr:(NSArray *)arr
{
    NSMutableString *ans = [NSMutableString string];
    NSArray *strArr = @[@"左 ", @"上 ", @"右", @"下"];
    for (NSNumber *num in arr) {
        [ans appendString:strArr[[num intValue]]];
    }
    NSLog(@"%@", ans);
}

@end
