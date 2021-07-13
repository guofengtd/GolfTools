//
//  NSAttributedString.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/6/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (Golf)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                             color:(UIColor *)color
                                              font:(UIFont *)font;

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                             color:(UIColor *)color
                                              font:(UIFont *)font
                                         alignment:(NSTextAlignment)alignment;

+ (NSAttributedString *)attributedStringWithString:(NSString *)string1
                                             color:(UIColor *)color1
                                              font:(UIFont *)font1
                                            string:(NSString *)string2
                                             color:(UIColor *)color2
                                              font:(UIFont *)font2;

+ (NSAttributedString *)attributedStringWithString:(NSString *)string1
                                             color:(UIColor *)color1
                                              font:(UIFont *)font1
                                            string:(NSString *)string2
                                             color:(UIColor *)color2
                                              font:(UIFont *)font2
                                         alignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
