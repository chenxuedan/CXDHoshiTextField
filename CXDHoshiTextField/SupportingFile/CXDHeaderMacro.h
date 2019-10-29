//
//  CXDHeaderMacro.h
//  CXDHoshiTextField
//
//  Created by xiao zude on 2019/10/29.
//  Copyright © 2019 cxd. All rights reserved.
//

#ifndef CXDHeaderMacro_h
#define CXDHeaderMacro_h

//标题色
#define CXDTitleColor RGB(60,60,67)
//333333
#define CXDTextColor RGB(21,21,21)
//666666
#define CXDContentColor RGB(102,102,102)
// 999999
#define CXDDetailColor RGB(153,153,153)
// cccccc
#define CXDCCCGrayColor RGB(204,204,204)

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//传入RGB三个参数，得到颜色
#define RGB(r,g,b) RGBA(r,g,b,1.f)
//取得随机颜色
#define RandomColor RGB(arc4random()%256,arc4random()%256,arc4random()%256)

//debug下打印， release下不打印
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

//----------------------------获取设备大小------------------------------
// NavBar高度
#define CXDNavigationBarHeight (self.navigationController.navigationBar.height)
// 状态栏高度
#define CXDStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
// 顶部高度     (iPhoneXLater ? 88 : 64)   (CXDNavigationBarHeight + CXDStatusBarHeight)
#define CXDTopHeight ((iPhoneXLater) ? 88 : 64)


// 底部 TabBar 高度     (iPhoneXLater ? 83 : 49)   (self.tabBarController.tabBar.height)
#define CXDTabBarHeight ((iPhoneXLater) ? 83 : 49)
// 动态获取屏幕宽高
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define CXDButtonHeight 49




#endif /* CXDHeaderMacro_h */
