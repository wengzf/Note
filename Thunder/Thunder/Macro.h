//
//  Macro.h
//  代码规范
//
//  Created by 翁志方 on 16/9/28.
//  Copyright © 2016年 翁志方. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


/*--------------------------------视图--------------------------------*/
#define KeyWindow  ([UIApplication sharedApplication].keyWindow)

#define ScreenBounds [UIScreen mainScreen].bounds               //屏幕尺寸
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

/*--------------------------------Log--------------------------------*/




/*--------------------------------颜色--------------------------------*/
#define UIColorWithHex(x) RGB(((x)&0xFF0000) >> 16, ((x)&0xFF00) >> 8 ,  ((x)&0xFF))

#define RGB(r,g,b)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define GRAY(x) RGB((x),(x),(x))

#define DeviderColor GRAY(224)                 // 分割线颜色

#define UIColor33 UIColorWithHex(0x333333)     // 字体颜色
#define UIColor66 UIColorWithHex(0x666666)
#define UIColor99 UIColorWithHex(0x999999)
#define UIColorCC UIColorWithHex(0xcccccc)

#define MainBtnColor UIColorWithHex(0xf98435)  // 按钮颜色

/*--------------------------------字体--------------------------------*/




/*--------------------------------GCD--------------------------------*/
//一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);


/*--------------------------------单例--------------------------------*/
//快速创建单例.h
#define SingletonH(Calss)     +(Calss *)sharedInstance;

//快速创建单例.m
#define SingletonM(Calss)     +(Calss *)sharedInstance\
{\
static Calss *CookieManagerInstance = nil;\
static dispatch_once_t predicate;\
dispatch_once(&predicate, ^{\
CookieManagerInstance               = [[Calss alloc] init];\
});\
return CookieManagerInstance;\
\
}\


/*--------------------------------沙盒路径--------------------------------*/
//获取temp
#define TempPath NSTemporaryDirectory()

//获取沙盒 Document
#define DocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define CachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



/*--------------------------------系统--------------------------------*/
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


/*--------------------------------避免循环引用--------------------------------*/
#ifndef    weakify
#if __has_feature(objc_arc)

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")

#else

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __block __typeof__(x) __block_##x##__ = x; \
_Pragma("clang diagnostic pop")

#endif
#endif

#ifndef    strongify
#if __has_feature(objc_arc)

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")

#else

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __block_##x##__; \
_Pragma("clang diagnostic pop")

#endif
#endif

/*--------------------------------账户信息--------------------------------*/













#endif /* Macro_h */
