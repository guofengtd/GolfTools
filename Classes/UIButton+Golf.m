//
//  UIButton.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/5/30.
//

#import "UIButton+Golf.h"
#import "UIImage+Golf.h"

@implementation UIButton (Golf)

+ (instancetype)buttonWithTitle:(NSString *)title
                     titleColor:(UIColor *)titleColor
                backgroundColor:(UIColor *)backgroundColor
                   cornerRadius:(CGFloat) cornerRadius
                     cornerMask:(CACornerMask)cornerMask {
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    UIImage *image = [UIImage imageWithColor:backgroundColor
                                        size:CGSizeMake(20, 20)
                                cornerRadius:cornerRadius
                                  cornerMask:cornerMask];
    
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    return btn;
}

@end
