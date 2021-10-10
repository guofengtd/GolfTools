//
//  NSDate+Golf.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/8/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Golf)

- (NSTimeInterval)timeIntervalToNow;

- (NSString *)timeStringToNow;

+ (NSString *)timeStringOfInterval:(NSInteger)interval;

- (NSString *)dateTimeString;

@end

NS_ASSUME_NONNULL_END
