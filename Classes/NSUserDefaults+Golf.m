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

#define TOKEN_KEY   @"token_key"

+ (NSString *)token {
    return [[self defaults] objectForKey:TOKEN_KEY];
}

+ (void)saveToken:(NSString *)token {
    [[self defaults] setObject:token?:@"" forKey:TOKEN_KEY];
}

#define ACCOUNT_LOGIN_USERNAME_KEY  @"account.login.username.key"

+ (NSString *)username {
    return [[self defaults] objectForKey:ACCOUNT_LOGIN_USERNAME_KEY]?:@"guofeng203";
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

@end
