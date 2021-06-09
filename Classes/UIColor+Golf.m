//
//  UIColor.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/6/9.
//

#import "UIColor+Golf.h"

@implementation UIColor (Golf)

+ (UIColor *)colorFromHex:(unsigned long)value {
    CGFloat red   = (value & 0xff0000) >> 16;
    CGFloat green = (value & 0x00ff00) >> 8;
    CGFloat blue  = (value & 0x0000ff);
    
    return [UIColor colorWithRed:red/0xff green:green/0xff blue:blue/0xff alpha:1.];
}

+ (UIColor *)colorFromHex:(unsigned long)value alpha:(CGFloat)alpha {
    UIColor *color = [UIColor colorFromHex:value];
    return [color colorWithAlphaComponent:alpha];
}

@end
