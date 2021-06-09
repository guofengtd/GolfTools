//
//  NSAttributedString.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/6/9.
//

#import "NSAttributedString+Golf.h"

@implementation NSAttributedString (Golf)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                             color:(UIColor *)color
                                              font:(UIFont *)font {
    return [[NSAttributedString alloc] initWithString:string
                                           attributes:@{NSForegroundColorAttributeName: color,
                                                        NSFontAttributeName: font}];
}

@end
