//
//  UIView+Golf.m
//  GolfTools
//
//  Created by 熊国锋 on 2021/7/22.
//

#import "UIView+Golf.h"

CGRect CGRectCentersRect(CGRect rect1, CGRect rect2) {
    return CGRectMake(rect1.origin.x + (CGRectGetWidth(rect1) - CGRectGetWidth(rect2)) / 2,
                      rect1.origin.y + (CGRectGetHeight(rect1) - CGRectGetHeight(rect2)) / 2,
                      rect2.size.width,
                      rect2.size.height);
}

@implementation UIView (Golf)

- (void)shake {
    [self shake:5 withDelta:5 speed:0.03];
}

- (void)shake:(int)times withDelta:(CGFloat)delta {
    [self shake:times withDelta:delta completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta completion:(nullable void (^)(void))handler {
    [self shake:times withDelta:delta speed:0.03 completion:handler];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval {
    [self shake:times withDelta:delta speed:interval completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(nullable void (^)(void))handler {
    [self shake:times withDelta:delta speed:interval shakeDirection:ShakeDirectionHorizontal completion:handler];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection {
    [self shake:times withDelta:delta speed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection completion:(nullable void (^)(void))completion {
    [self _shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:completion];
}

- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection completion:(void (^)(void))completionHandler {
    __weak UIView *weakSelf = self;
    [UIView animateWithDuration:interval animations:^{
        switch (shakeDirection) {
            case ShakeDirectionVertical:
                weakSelf.layer.affineTransform = CGAffineTransformMakeTranslation(0, delta * direction);
                break;
            case ShakeDirectionRotation:
                weakSelf.layer.affineTransform = CGAffineTransformMakeRotation(M_PI * delta / 1000.0f * direction);
                break;
            case ShakeDirectionHorizontal:
                weakSelf.layer.affineTransform = CGAffineTransformMakeTranslation(delta * direction, 0);
            default:
                break;
        }
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                weakSelf.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [weakSelf _shake:times
           direction:direction * -1
        currentTimes:current + 1
           withDelta:delta
               speed:interval
      shakeDirection:shakeDirection
          completion:completionHandler];
    }];
}

@end
