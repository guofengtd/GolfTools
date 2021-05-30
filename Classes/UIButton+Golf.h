//
//  UIButton.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Golf)

+ (instancetype)buttonWithTitle:(NSString *)title
                     titleColor:(UIColor *)titleColor
                backgroundColor:(UIColor *)backgroundColor
                   cornerRadius:(CGFloat) cornerRadius
                     cornerMask:(CACornerMask)cornerMask;

@end

NS_ASSUME_NONNULL_END
