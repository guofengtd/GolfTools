//
//  BaseTableViewHeaderFooterView.m
//  hibibi
//
//  Created by 熊国锋 on 2021/9/3.
//

#import "BaseTableViewHeaderFooterView.h"

@implementation BaseTableViewHeaderFooterView

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
