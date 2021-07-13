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
                          color:(UIColor *)color
                backgroundColor:(nullable UIColor *)backgroundColor
                    borderColor:(nullable UIColor *)borderColor
                    cornerRadii:(CGSize)cornerRadii {
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    
    if (backgroundColor) {
        UIImage *image = [UIImage imageWithColor:backgroundColor?:[UIColor new]
                                     borderColor:borderColor
                                            size:CGSizeMake(cornerRadii.width * 2, cornerRadii.height * 2)
                                     rectCorners:UIRectCornerAllCorners
                                     cornerRadii:cornerRadii];
        
        [btn setBackgroundImage:[image stretchableImageWithLeftCapWidth:cornerRadii.width topCapHeight:cornerRadii.height]
                       forState:UIControlStateNormal];
    }
    
    return btn;
}

- (void)setTitle:(NSString *)title
           color:(UIColor *)color
 backgroundColor:(nullable UIColor *)backgroundColor
     borderColor:(nullable UIColor *)borderColor
     cornerRadii:(CGSize)cornerRadii {
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateNormal];
    
    UIImage *image = [UIImage imageWithColor:backgroundColor
                                 borderColor:borderColor
                                        size:CGSizeMake(cornerRadii.width * 2, cornerRadii.height * 2)
                                 rectCorners:UIRectCornerAllCorners
                                 cornerRadii:cornerRadii];
    
    [self setBackgroundImage:[image stretchableImageWithLeftCapWidth:cornerRadii.width topCapHeight:cornerRadii.height]
                   forState:UIControlStateNormal];
}

@end
