//
//  UIColor+Hex.m
//  TextCustomServiceDemo
//
//  Created by 钱伟龙 on 2017/3/16.
//  Copyright © 2017年 duoduo. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexStr:(NSString *)hexString{
    return [self colorWithHexStr:hexString alpha:1.f];
}

+ (UIColor *)colorWithHexStr:(NSString *)hexString alpha:(CGFloat)alpha{
    if (hexString.length == 0) {
        return nil;
    }
    
    if ([hexString characterAtIndex:0] == '#') {
        hexString = [hexString stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@"0x"];
    }
    
    if (hexString.length == 8 && [[hexString substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"0x"]) {
        
        unsigned hexNumber = 0.f;
        
        NSScanner * hexValueScanner = [NSScanner scannerWithString:hexString];
        [hexValueScanner scanHexInt:&hexNumber];
        
        return [[self colorWithRGBHex:hexNumber] colorWithAlphaComponent:alpha];
    }
    
    return nil;
}

- (NSString *)hexString
{
    CGFloat red,green,blue;
    
    if ([self getRed:&red green:&green blue:&blue alpha:nil]) {
        
        UInt8 _red = red * UINT8_MAX;
        UInt8 _green = green * UINT8_MAX;
        UInt8 _blue = blue * UINT8_MAX;
        
        return [NSString stringWithFormat:@"0x%02X%02X%02X",_red,_green,_blue];
    }
    return nil;
}

#pragma mark -

+ (UIColor *)colorWithRGBHex:(UInt32)hex{
    int r = (hex >> 16) &0xFF;
    int g = (hex >> 8) &0xFF;
    int b = (hex) &0xFF;
    return [UIColor colorWithRed:r /255.0f
                           green:g /255.0f
                            blue:b /255.0f
                           alpha:1.0f];
}

@end
