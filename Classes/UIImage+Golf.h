//
//  UIImage.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Golf)

+ (UIImage *)imageWithColor:(UIColor *)color
                borderColor:(UIColor *)borderColor
                       size:(CGSize)size
                rectCorners:(UIRectCorner)rectCorners
                cornerRadii:(CGSize)cornerRadii;

@end

NS_ASSUME_NONNULL_END
