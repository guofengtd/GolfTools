//
//  UIAlertController+Golf.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/6/16.
//

#import "UIAlertController+Golf.h"

@implementation UIAlertController (Golf)

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                     style:(UIAlertControllerStyle)style
                   okTitle:(NSString *)okTitle
                  okAction:(void (^)(UIAlertAction * _Nonnull))okAction
               cancelTitle:(NSString *)cancelTitle
              cancelAction:(void (^)(UIAlertAction * _Nonnull))cancelAction
            viewController:(UIViewController *)viewController
           completionBlock:(void (^)(void))completionBlock {
    [self showAlertWithTitle:title
                     message:message
                       style:style
                     okTitle:okTitle
                     okStyle:UIAlertActionStyleDefault
                    okAction:okAction
                 cancelTitle:cancelTitle
                cancelAction:cancelAction
              viewController:viewController
             completionBlock:completionBlock];
}

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                     style:(UIAlertControllerStyle)style
                   okTitle:(NSString *)okTitle
                   okStyle:(UIAlertActionStyle)okStyle
                  okAction:(void (^)(UIAlertAction * _Nonnull))okAction
               cancelTitle:(NSString *)cancelTitle
              cancelAction:(void (^)(UIAlertAction * _Nonnull))cancelAction
            viewController:(UIViewController *)viewController
           completionBlock:(void (^)(void))completionBlock {
    [self showAlertWithTitle:title
                     message:message
                       style:style
               barButtonItem:nil
                  sourceView:nil
                  sourceRect:CGRectZero
                     okTitle:okTitle
                     okStyle:okStyle
                    okAction:okAction
                 cancelTitle:cancelTitle
                cancelAction:cancelAction
              viewController:viewController
             completionBlock:completionBlock];
}

+ (void)showAlertWithTitle:(nullable NSString *)title
                   message:(nullable NSString *)message
                     style:(UIAlertControllerStyle)style
             barButtonItem:(UIBarButtonItem *)item
                sourceView:(UIView *)view
                sourceRect:(CGRect)rect
                   okTitle:(nullable NSString *)okTitle
                   okStyle:(UIAlertActionStyle)okStyle
                  okAction:(void (^ __nullable)(UIAlertAction *action))okAction
               cancelTitle:(nullable NSString *)cancelTitle
              cancelAction:(void (^ __nullable)(UIAlertAction *action))cancelAction
            viewController:(UIViewController *)viewController
           completionBlock:(void (^ __nullable)(void))completionBlock {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:style];
    
    if (okTitle) {
        UIAlertAction *ok = [UIAlertAction actionWithTitle:okTitle
                                                     style:okStyle
                                                   handler:okAction];
        
        [alert addAction:ok];
    }
    
    if (cancelTitle) {
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle
                                                         style:UIAlertActionStyleCancel
                                                       handler:cancelAction];
        
        [alert addAction:cancel];
    }
    
    alert.popoverPresentationController.barButtonItem = item;
    alert.popoverPresentationController.sourceView = view;
    alert.popoverPresentationController.sourceRect = rect;
    
    [viewController presentViewController:alert
                                 animated:YES
                               completion:completionBlock];
}

@end
