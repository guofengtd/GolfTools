//
//  NSBundle+Golf.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/8/10.
//

#import "NSBundle+Golf.h"

@implementation NSBundle (Golf)

- (NSString *)versionString {
    return [[self infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)buildVersionString {
    return [[self infoDictionary] objectForKey:@"CFBundleVersion"];
}

@end
