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

@end

NS_ASSUME_NONNULL_END
