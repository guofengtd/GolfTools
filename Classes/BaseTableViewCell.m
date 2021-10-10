//
//  BaseTableViewCell.m
//  hiSIP
//
//  Created by 熊国锋 on 2021/6/8.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

@end

