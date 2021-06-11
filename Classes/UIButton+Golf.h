//
//  UIButton.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/5/30.
//

#import <UIKit/UIKit.h>
#import "UIImage+Golf.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Golf)

+ (instancetype)buttonWithTitle:(NSString *)title
                          color:(UIColor *)color
                backgroundColor:(UIColor *)backgroundColor
                    borderColor:(nullable UIColor *)borderColor
                    cornerRadii:(CGSize)cornerRadii;

- (void)setTitle:(NSString *)title
           color:(UIColor *)color
 backgroundColor:(UIColor *)backgroundColor
     borderColor:(nullable UIColor *)borderColor
     cornerRadii:(CGSize)cornerRadii;

@end

NS_ASSUME_NONNULL_END
