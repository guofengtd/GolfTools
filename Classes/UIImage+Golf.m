//
//  UIImage.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/5/30.
//

#import "UIImage+Golf.h"
#import "NSAttributedString+Golf.h"
#import <SDWebImage/UIImage+Transform.h>

@implementation UIImage (Golf)

+ (UIImage *)imageWithColor:(nullable UIColor *)color
                borderColor:(nullable UIColor *)borderColor
                       size:(CGSize)size
                rectCorners:(UIRectCorner)rectCorners
                cornerRadii:(CGSize)cornerRadii {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                               byRoundingCorners:rectCorners
                                                     cornerRadii:cornerRadii];
    
    if (color) {
        [path addClip];
        
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);
    }
    
    if (borderColor) {
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        [path stroke];
    }
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
                       font:(UIFont *)font
                rectCorners:(UIRectCorner)rectCorners
                cornerRadii:(CGSize)cornerRadii {
    UIImage *image = [UIImage imageWithColor:color
                                 borderColor:nil
                                        size:size
                                 rectCorners:rectCorners
                                 cornerRadii:cornerRadii];
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    if (text) {
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.alignment = NSTextAlignmentCenter;
        
        NSAttributedString *string = [[NSAttributedString alloc] initWithString:text
                                                                     attributes:@{NSForegroundColorAttributeName: textColor,
                                                                                  NSFontAttributeName: font,
                                                                                  NSParagraphStyleAttributeName: style}];
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        CGFloat dx = (CGRectGetWidth(rect) - string.size.width) / 2;
        CGFloat dy = (CGRectGetHeight(rect) - string.size.height) / 2;
        rect = CGRectInset(rect, dx, dy);
        
        [string drawInRect:rect];
    }
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage *)imageRoundedByCorners:(UIRectCorner)rectCorners
                       cornerRadii:(CGSize)cornerRadii {
    CGSize size = self.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                               byRoundingCorners:rectCorners
                                                     cornerRadii:cornerRadii];
    
    [path addClip];
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage *)imageMaskedWithColor:(UIColor *)maskColor {
    NSParameterAssert(maskColor != nil);
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextScaleCTM(context, 1.0f, -1.0f);
        CGContextTranslateCTM(context, 0.0f, -(imageRect.size.height));
        
        CGContextClipToMask(context, imageRect, self.CGImage);
        CGContextSetFillColorWithColor(context, maskColor.CGColor);
        CGContextFillRect(context, imageRect);
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)croppedImageWithRatio:(CGFloat)ratio {
    CGSize size = self.size;
    CGFloat ratioOriginal = size.width / size.height;
    
    if (ratioOriginal == ratio) {
        return self;
    }
    
    CGRect rect;
    if (ratio > ratioOriginal) {
        CGFloat width = size.width;
        CGFloat height = width / ratio;
        
        rect = CGRectMake(0, (size.height - height) / 2., width, height);
    }
    else {
        CGFloat height = size.height;
        CGFloat width = height * ratio;
        
        rect = CGRectMake((size.width - width) / 2., 0, width, height);
    }
    
    return [self sd_croppedImageWithRect:rect];
}

@end
