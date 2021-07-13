//
//  NSString+Golf.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/7/3.
//

#import "NSString+Golf.h"

@implementation NSString (Golf)

- (BOOL)isEnglish {
    NSString *uppercaseString = self.uppercaseString;
    unichar buffer[1024];
    NSInteger len = MIN(1024, uppercaseString.length);
    
    [uppercaseString getCharacters:buffer range:NSMakeRange(0, len)];
    
    int index = 0;
    while (index < len) {
        if (buffer[index] < 'A' || buffer[index] > 'Z') {
            return FALSE;
        }
        
        index++;
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

@end
