//
//  NSString+Golf.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/7/3.
//

#import "NSString+Golf.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Golf)

- (BOOL)isEnglish {
    NSString *uppercaseString = self.uppercaseString;
    unichar buffer[1024];
    NSInteger len = MIN(1024, uppercaseString.length);
    
    [uppercaseString getCharacters:buffer range:NSMakeRange(0, len)];
    
    int index = 0;
    while (index < len) {
        if (buffer[index] >= 'A' && buffer[index] <= 'Z') {
            index++;
            continue;
        }
        
        if (buffer[index] >= '0' && buffer[index] <= '9') {
            index++;
            continue;
        }
        
        if ([[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:buffer[index]]) {
            index++;
            continue;
        }
        
        return FALSE;
    }
    
    return TRUE;
}

- (NSString*)pinyinWithPhoneticSymbol {
    NSMutableString *pinyin = [NSMutableString stringWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformMandarinLatin, NO);
    return pinyin;
}

- (NSString*)pinyin {
    NSMutableString *pinyin = [NSMutableString stringWithString:[self pinyinWithPhoneticSymbol]];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformStripCombiningMarks, NO);
    return pinyin;
}

- (NSArray*)pinyinArray {
    NSArray *array = [[self pinyin] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return array;
}

- (NSString*)pinyinWithoutBlank {
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString *str in [self pinyinArray]) {
        [string appendString:str];
    }
    return string;
}

- (NSArray*)pinyinInitialsArray {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *str in [self pinyinArray]) {
        if ([str length] > 0) {
            [array addObject:[str substringToIndex:1]];
        }
    }
    return array;
}

- (NSString*)pinyinInitialsString {
    NSMutableString *pinyin = [NSMutableString stringWithString:@""];
    for (NSString *str in [self pinyinArray]) {
        if ([str length] > 0) {
            [pinyin appendString:[str substringToIndex:1]];
        }
    }
    return pinyin;
}

- (NSString *)phoneNumberByTrimingMiscs {
    NSString *string = [self stringByReplacingOccurrencesOfString:@"-" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"(" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@")" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    return string;
}

- (NSString *)md5 {
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(data.bytes, (unsigned int)data.length, md5Buffer);
    
    // Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

- (NSString *)sha256 {
    unsigned char sha256Buffer[CC_SHA256_DIGEST_LENGTH];
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_SHA256(data.bytes, (unsigned int)data.length, sha256Buffer);
    
    // Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",sha256Buffer[i]];
    
    return output;
}

- (NSString *)fileExt {
    NSArray *aa = [self componentsSeparatedByString:@"."];
    if (aa.count > 1) {
        NSString *ext = [aa lastObject];
        return [ext lowercaseString];
    }
    
    return nil;
}

@end

@implementation NSString (AliOSS)

- (NSString *)aliOSSThumbnailWithSize:(int)size {
    return [NSString stringWithFormat:@"%@?x-oss-process=image/resize,l_%d,m_mfit", self, size];
}

@end

