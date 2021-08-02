//
//  UIImage.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Golf)

+ (UIImage *)imageWithColor:(nullable UIColor *)color
                borderColor:(nullable UIColor *)borderColor
                       size:(CGSize)size
                rectCorners:(UIRectCorner)rectCorners
                cornerRadii:(CGSize)cornerRadii;

+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
                rectCorners:(UIRectCorner)rectCorners
                cornerRadii:(CGSize)cornerRadii;

- (UIImage *)imageRoundedByCorners:(UIRectCorner)rectCorners
                       cornerRadii:(CGSize)cornerRadii;

- (UIImage *)imageMaskedWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
