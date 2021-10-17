//
//  NSData+Golf.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/7/30.
//

#import "NSData+Golf.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Golf)

- (NSString *)md5 {
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(self.bytes, (unsigned int)self.length, md5Buffer);
    
    // Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

- (NSString *)stringSize {
    if (self.length > 1024 * 1024) {
        return [NSString stringWithFormat:@"%.02f M", self.length / 1024. / 1024.];
    }
    else if (self.length > 1024) {
        return [NSString stringWithFormat:@"%.02f K", self.length / 1024.];
    }
    else {
        return [NSString stringWithFormat:@"%.0f Bytes", self.length];
    }
}

@end
