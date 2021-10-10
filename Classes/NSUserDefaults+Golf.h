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

+ (NSString *)username;
+ (void)saveUsername:(NSString *)username;

+ (BOOL)conversationTextMode;
+ (void)saveConversationTextMode:(BOOL)textMode;

+ (NSInteger)tabIndex;
+ (void)saveTabIndex:(NSInteger)tabIndex;

+ (NSString *)lastCallNumber;
+ (void)saveLastCallNumber:(NSString *)number;

+ (BOOL)chatNotification;
+ (void)saveChatNotification:(BOOL)notification;

+ (BOOL)chatAutoDownload;
+ (void)saveChatAutoDownload:(BOOL)autoDownload;

+ (NSString *)chatBackgroundImage;
+ (void)saveChatBackgroundImage:(NSString *)imageUrl;

@end

NS_ASSUME_NONNULL_END
