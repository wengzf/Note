//
//  AppDelegate.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/5/12.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef struct Node{
    int val;
    struct Node *next;
}Node;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

