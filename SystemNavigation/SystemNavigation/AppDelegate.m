//
//  AppDelegate.m
//  SystemNavigation
//
//  Created by 翁志方 on 16/5/12.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "AppDelegate.h"







@interface AppDelegate ()

@end

@implementation AppDelegate


void addNode(int val,Node *list )
{
    Node *tmp = malloc(sizeof(Node));
    tmp->val = val;
    
    tmp->next = list->next;
    list->next = tmp;
}
void pritList(Node *list)
{
    while (list) {
        printf("%d ",list->val);
        list = list->next;
    }
    printf("\n");
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Node *p;
    Node *q;
    
    p = malloc(sizeof(Node));
    q = malloc(sizeof(Node));
    p->val = 1;
    p->next = 0;
    
    q->val = 3;
    q->next = 0;
    
    addNode(7, p);
    addNode(5, p);
    addNode(2, p);
    
    addNode(8, q);
    addNode(6, q);
    addNode(4, q);
    
    pritList(p);
    
    pritList(q);
    
    Node  *res, *ans;
    
    if (p->val > q->val) {
        res = ans = q;
        q = q->next;
    }else{
        res = ans = p;
        p = p->next;
    }
    
    while (p || q) {
        if (p && q) {
            if (p->val > q->val ) {
                res->next = q;
                q = q->next;
            }else{
                res->next = p;
                p = p->next;
            }
        }else if (p){
            res->next = p;
            p = p->next;
        }else{
            res->next = q;
            q = q->next;
        }
        
        res = res->next;
    }
    
    
    pritList(ans);
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
