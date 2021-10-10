//
//  BaseCollectionViewCell.m
//  hibibi
//
//  Created by 熊国锋 on 2021/8/7.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

@end

