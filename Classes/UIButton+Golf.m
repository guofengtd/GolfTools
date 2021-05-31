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
                    cornerRadii:(CGSize)cornerRadii {
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    UIImage *image = [UIImage imageWithColor:backgroundColor
                                        size:CGSizeMake(cornerRadii.width * 2, cornerRadii.height * 2)
                                 rectCorners:UIRectCornerAllCorners
                                 cornerRadii:cornerRadii];
    
    [btn setBackgroundImage:[image stretchableImageWithLeftCapWidth:cornerRadii.width topCapHeight:cornerRadii.height]
                   forState:UIControlStateNormal];
    
    return btn;
}

@end
