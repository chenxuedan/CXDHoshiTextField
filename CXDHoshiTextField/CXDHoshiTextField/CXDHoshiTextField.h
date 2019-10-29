//
//  CXDHoshiTextField.h
//  Schedule
//
//  Created by xiao zude on 2019/3/5.
//  Copyright © 2019年 cxd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXDHoshiTextField : UITextField

//正常分割线条颜色
@property (nonatomic, strong) UIColor *borderInactiveColor;
//高亮状态线条颜色
@property (nonatomic, strong) UIColor *borderActiveColor;
//占位文本Label
@property (nonatomic, strong) UILabel *placeholderLabel;
//占位字体大小
@property (nonatomic, assign) CGFloat litFontSize;
//标题文本大小
@property (nonatomic, assign) CGFloat titleFontSize;

@end

NS_ASSUME_NONNULL_END
