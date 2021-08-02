//
//  NSUserDefaults+Golf.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/6/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (Golf)

+ (NSString *)splashValue;
+ (void)saveSplashValue:(NSString *)value;

+ (NSString *)token;
+ (void)saveToken:(NSString *)token;

+ (NSString *)username;
+ (void)saveUsername:(NSString *)username;

+ (BOOL)conversationTextMode;
+ (void)saveConversationTextMode:(BOOL)textMode;

@end

NS_ASSUME_NONNULL_END
