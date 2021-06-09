//
//  UIImage.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/5/30.
//

#import "UIImage+Golf.h"

@implementation UIImage (Golf)

+ (UIImage *)imageWithColor:(UIColor *)color
                borderColor:(UIColor *)borderColor
                       size:(CGSize)size
                rectCorners:(UIRectCorner)rectCorners
                cornerRadii:(CGSize)cornerRadii {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                               byRoundingCorners:rectCorners
                                                     cornerRadii:cornerRadii];
    [path addClip];
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    if (borderColor) {
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        [path stroke];
    }
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
