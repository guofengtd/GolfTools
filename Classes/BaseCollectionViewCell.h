//
//  BaseCollectionViewCell.h
//  hibibi
//
//  Created by 熊国锋 on 2021/8/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) NSIndexPath       *indexPath;

+ (NSString *)cellReuseIdentifier;

@end

NS_ASSUME_NONNULL_END

