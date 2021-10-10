//
//  NSUserDefaults+Golf.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/6/11.
//

#import "NSUserDefaults+Golf.h"

@implementation NSUserDefaults (Golf)

+ (instancetype)defaults {
    static dispatch_once_t onceToken;
    static NSUserDefaults *defaults = nil;
    dispatch_once(&onceToken, ^{
        defaults = [[NSUserDefaults alloc] initWithSuiteName:@"extra_defauts"];
    });
    
    return defaults;
}

#define SPLASH_KEY @"splash_key"

+ (NSString *)splashValue {
    return [[self defaults] objectForKey:SPLASH_KEY];
}

+ (void)saveSplashValue:(NSString *)value {
    [[self defaults] setObject:value?:@"" forKey:SPLASH_KEY];
}

#define ACCOUNT_LOGIN_USERNAME_KEY  @"account.login.username.key"

+ (NSString *)username {
    return [[self defaults] objectForKey:ACCOUNT_LOGIN_USERNAME_KEY];
}

+ (void)saveUsername:(NSString *)username {
    [[self defaults] setObject:username?:@"" forKey:ACCOUNT_LOGIN_USERNAME_KEY];
}

#define CONVERSATION_TEXT_MODE_KEY  @"conversation.text.mode.key"

+ (BOOL)conversationTextMode {
    NSNumber *number = [[self defaults] objectForKey:CONVERSATION_TEXT_MODE_KEY];
    return number?number.boolValue:TRUE;
}

+ (void)saveConversationTextMode:(BOOL)textMode {
    [[self defaults] setObject:@(textMode) forKey:CONVERSATION_TEXT_MODE_KEY];
}

#define MAIN_TAB_INDEX_KEY  @"main.tab.index.key"

+ (NSInteger)tabIndex {
    NSNumber *num = [[self defaults] objectForKey:MAIN_TAB_INDEX_KEY];
    return num?num.integerValue:0;
}

+ (void)saveTabIndex:(NSInteger)tabIndex {
    [[self defaults] setObject:@(tabIndex) forKey:MAIN_TAB_INDEX_KEY];
}

#define CALL_LAST_NUMBER    @"call.last.phone.number.key"

+ (NSString *)lastCallNumber {
    return [[self defaults] objectForKey:CALL_LAST_NUMBER];
}

+ (void)saveLastCallNumber:(NSString *)number {
    [[self defaults] setObject:number?:@"" forKey:CALL_LAST_NUMBER];
}

#define CHAT_NOTIFICATION  @"chat.notification.key"

+ (BOOL)chatNotification {
    NSNumber *num = [[self defaults] objectForKey:CHAT_NOTIFICATION];
    return num?num.boolValue:FALSE;
}

+ (void)saveChatNotification:(BOOL)notification {
    [[self defaults] setObject:@(notification) forKey:CHAT_NOTIFICATION];
}

#define CHAT_AUTO_DOWNLOAD_KEY  @"chat.auto.download.key"

+ (BOOL)chatAutoDownload {
    NSNumber *num = [[self defaults] objectForKey:CHAT_AUTO_DOWNLOAD_KEY];
    return num?num.boolValue:FALSE;
}

+ (void)saveChatAutoDownload:(BOOL)autoDownload {
    [[self defaults] setObject:@(autoDownload) forKey:CHAT_AUTO_DOWNLOAD_KEY];
}

#define CHAT_BACKGROUND_IMAGE_KEY   @"chat.background.image.key"

+ (NSString *)chatBackgroundImage {
    return [[self defaults] objectForKey:CHAT_BACKGROUND_IMAGE_KEY];
}

+ (void)saveChatBackgroundImage:(NSString *)imageUrl {
    [[self defaults] setObject:imageUrl?:@"" forKey:CHAT_BACKGROUND_IMAGE_KEY];
}

@end
