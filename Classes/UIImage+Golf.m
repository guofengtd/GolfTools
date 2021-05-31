//
//  UIImage.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/5/30.
//

#import "UIImage+Golf.h"

@implementation UIImage (Golf)

+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size
                rectCorners:(UIRectCorner)rectCorners
                cornerRadii:(CGSize)cornerRadii {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect
                           byRoundingCorners:rectCorners
                                 cornerRadii:cornerRadii] addClip];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
