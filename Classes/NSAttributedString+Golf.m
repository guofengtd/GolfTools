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

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                             color:(UIColor *)color
                                              font:(UIFont *)font
                                             style:(NSParagraphStyle *)style {
    return [[NSAttributedString alloc] initWithString:string
                                           attributes:@{NSForegroundColorAttributeName: color,
                                                        NSFontAttributeName: font,
                                                        NSParagraphStyleAttributeName: style}];
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string1
                                             color:(UIColor *)color1
                                              font:(UIFont *)font1
                                            string:(NSString *)string2
                                             color:(UIColor *)color2
                                              font:(UIFont *)font2 {
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:string1
                                                                                attributes:@{NSForegroundColorAttributeName: color1,
                                                                                             NSFontAttributeName: font1}];
    
    if (string2.length) {
        [aString appendAttributedString:[[NSAttributedString alloc] initWithString:string2
                                                                           attributes:@{NSForegroundColorAttributeName: color2,
                                                                                        NSFontAttributeName: font2}]];
    }
    
    return [aString copy];
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string1
                                             color:(UIColor *)color1
                                              font:(UIFont *)font1
                                            string:(NSString *)string2
                                             color:(UIColor *)color2
                                              font:(UIFont *)font2
                                             style:(NSParagraphStyle *)style {
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:string1
                                                                                attributes:@{NSForegroundColorAttributeName: color1,
                                                                                             NSFontAttributeName: font1,
                                                                                             NSParagraphStyleAttributeName: style}];
    
    if (string2.length) {
        [aString appendAttributedString:[[NSAttributedString alloc] initWithString:string2
                                                                        attributes:@{NSForegroundColorAttributeName: color2,
                                                                                     NSFontAttributeName: font2,
                                                                                     NSParagraphStyleAttributeName: style}]];
    }
    
    return [aString copy];
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                        searchText:(NSString *)searchText
                                             color:(UIColor *)color
                                          fontSize:(CGFloat)fontSize {
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:string
                                                                                attributes:@{NSForegroundColorAttributeName: color,
                                                                                             NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    
    NSUInteger location = 0;
    while (location < string.length) {
        NSRange range = [string rangeOfString:searchText?:@""
                                      options:NSCaseInsensitiveSearch
                                        range:NSMakeRange(location, string.length - location)];
        if (range.length == 0) {
            break;
        }
        
        [aString addAttributes:@{NSForegroundColorAttributeName: color,
                                 NSFontAttributeName: [UIFont boldSystemFontOfSize:fontSize]}
                         range:range];
        
        location += range.length;
    }
    
    return [aString copy];
}

@end

