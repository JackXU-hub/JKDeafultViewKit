//
//  UIColor+Hex.h
//  TextCustomServiceDemo
//
//  Created by 钱伟龙 on 2017/3/16.
//  Copyright © 2017年 duoduo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 通过十六进制字符串返回对应的颜色

 @param hexString 十六进制数
 @return 返回颜色
 */
+ (UIColor *)colorWithHexStr:(NSString *)hexString;


/**
 通过十六进制字符串和透明度返回对应的颜色

 @param hexString 十六进制数
 @param alpha 透明度
 @return 返回颜色
 */
+ (UIColor *)colorWithHexStr:(NSString *)hexString alpha:(CGFloat)alpha;


/**
 返回颜色对应的十六进制数的字符串

 @return 返回十六进制的字符串
 */
- (NSString *)hexString;

@end
