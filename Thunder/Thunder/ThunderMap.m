//
//  ThunderMap.m
//  Thunder
//
//  Created by 翁志方 on 2016/10/25.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#import "ThunderMap.h"

@implementation ThunderMap


- (void) generateMapWithSize:(NSInteger)size thunderNum:(NSInteger) num
{
    for (int i=0; i<=size+1; ++i) {
        for (int j=0; j<=size+1; ++j) {
            map[i][j] = 0;
        }
    }
    
    // 开始随机
    for (int i=0; i<num; ++i) {
        int row = arc4random()%size+1;
        int col = arc4random()%size+1;
    
        if (map[row][col] == -1) {
            // 已经是雷了
            --i;
        }else{
            // 检查这个位置周围至少一个空位
            BOOL flag = false;
            for (int j=row-1; j<row+2; ++j) {
                for (int k=col-1; k<col+2; ++k) {
                    if (1<=j && j<=size &&
                        1<=k && k<=size &&
                        map[j][k] == 0) {
                        flag = true;
                    }
                }
            }
            
            if (flag) {
                map[row][col] = -1;
            }else{
                --i;
            }
        }
    }
    
    // 生成数字
    for (int i=1; i<=size; ++i) {
        for (int j=1; j<=size; ++j) {
            
            if (map[i][j] == 0){
                int cnt = 0;
                for (int k=i-1; k<=i+1; ++k) {
                    for (int l=j-1; l<=j+1; ++l) {
                        if (map[k][l] == -1){
                            ++cnt;
                        }
                    }
                }
                map[i][j] = cnt;
            }
        }
    }
    // 生成数字
    for (int i=1; i<=size; ++i) {
        
        printf("\n");
        for (int j=1; j<=size; ++j) {
            
            printf("%d  ",map[i][j]);
            
        }
        printf("\n");
    }
    
    
    
    
}


@end
