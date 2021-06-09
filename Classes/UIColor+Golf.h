//
//  UIColor.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Golf)

+ (UIColor *)colorFromHex:(unsigned long)value;

+ (UIColor *)colorFromHex:(unsigned long)value alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
