//
//  PushBoxSearchAnswer.h
//  PushBox
//
//  Created by 翁志方 on 16/6/3.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StateUnit: NSObject


@property (nonatomic, strong) NSMutableArray *mpArr;    // 地图

@property (nonatomic, assign) NSInteger posx;           // 人做在的位置
@property (nonatomic, assign) NSInteger posy;

@property (nonatomic, strong) NSString *keyStr;      

@property (nonatomic, assign) NSInteger operation;

@property (nonatomic, assign) NSInteger preIndex;



- (StateUnit *)nextStateWithDir:(int [2])dir;

- (BOOL)checkDestination;

@end



@interface PushBoxSearchAnswer : NSObject
{
    NSMutableDictionary *checkedDic;
    NSMutableArray *stateArr;
}

- (void)searchInit;
- (void)searchAns;


@end




/*
 1. 地图表示  （8*8）  mp[8][8]
        8 = 障碍物
        4 = 目标
        2 = 箱子
        1 = 人
 
    输入开始状态和终止状态
 
    StateUnit
        当前地图
        人所在位置
        上一个状态地址
        上一个状态操作
 
 
 
    a) 开始状态进入队列
 
    b) 取出队列第一个元素 
            枚举小人的4个操作
            判断操作是否可行    移动，推动箱子
                操作的状态是否是终止状态， 结束
                否则 判断状态是否已经被枚举过，通过NSSet进行判断 重复b）
                    进入队列 根据地图生成字符串加入Set
 
 
 
    根据地图生成字符串
        两个格子生成一个ascii码 串联在一起
 
 
 
 
 
 
 */



