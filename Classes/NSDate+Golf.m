//
//  NSDate+Golf.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/8/2.
//

#import "NSDate+Golf.h"

@implementation NSDate (Golf)

- (NSTimeInterval)timeIntervalToNow {
    return -[self timeIntervalSinceNow];
}

- (NSString *)timeStringToNow {
    NSInteger interval = (NSInteger)[self timeIntervalToNow];
    
    return [NSDate timeStringOfInterval:interval];
}

+ (NSString *)timeStringOfInterval:(NSInteger)interval {
    NSInteger seconds = interval % 60;
    NSInteger minutes = interval / 60 % 60;
    NSInteger hours = interval / (60 * 60);
    
    if (hours > 0) {
        return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    }
    else {
        return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    }
}

- (NSString *)dateTimeString {
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *aa = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                       fromDate:self];
    
    NSDateComponents *bb = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                       fromDate:now];
    
    if (aa.year == bb.year && aa.month == bb.month && aa.day == bb.day) {
        // the same day
        formatter.dateStyle = NSDateFormatterNoStyle;
        formatter.timeStyle = NSDateFormatterShortStyle;
    }
    else if (aa.year != bb.year) {
        // another year
        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    }
    else {
        formatter.dateFormat = @"MM-dd HH:mm";
    }
    
    return [formatter stringFromDate:self];
}

@end
