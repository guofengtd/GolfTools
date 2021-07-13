//
//  UIAlertController+Golf.h
//  GolfTools
//
//  Created by 熊国锋 on 2021/6/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (Golf)

+ (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
                     style:(UIAlertControllerStyle)style
                   okTitle:(nullable NSString *)okTitle
                  okAction:(void (^ __nullable)(UIAlertAction *action))okAction
               cancelTitle:(nullable NSString *)cancelTitle
              cancelAction:(void (^ __nullable)(UIAlertAction *action))cancelAction
            viewController:(UIViewController *)viewController
           completionBlock:(void (^ __nullable)(void))completionBlock;

+ (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
                     style:(UIAlertControllerStyle)style
                   okTitle:(nullable NSString *)okTitle
                   okStyle:(UIAlertActionStyle)okStyle
                  okAction:(void (^ __nullable)(UIAlertAction *action))okAction
               cancelTitle:(nullable NSString *)cancelTitle
              cancelAction:(void (^ __nullable)(UIAlertAction *action))cancelAction
            viewController:(UIViewController *)viewController
           completionBlock:(void (^ __nullable)(void))completionBlock;

@end

NS_ASSUME_NONNULL_END
