//
//  NSString+Golf.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define GOLF_VALIDATE_STRING(str)                   [str isKindOfClass:[NSString class]]?str:nil
#define GOLF_VALIDATE_STRING_DEFAULT(str, default)  [str isKindOfClass:[NSString class]]?str:default

@interface NSString (Golf)

- (BOOL)isEnglish;

- (NSString*)pinyin;

- (NSString *)phoneNumberByTrimingMiscs;

- (NSString *)md5;

- (NSString *)sha256;

@end

@interface NSString (AliOSS)

- (NSString *)aliOSSThumbnailWithSize:(int)size;

@end

NS_ASSUME_NONNULL_END
