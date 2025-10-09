//
//  CBView.m
//  CBUIKitDebug
//
//  Created by 陈彬 on 2025/10/7.
//

#import "CBView.h"

@implementation CBView

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
////    if (!self.userInteractionEnabled || self.hidden || self.alpha <= 0.01) return nil;
////    if (![self pointInside:point withEvent:event]) return nil;
////    for (UIView *subview in self.subviews.reverseObjectEnumerator) {
////        CGPoint convertPoint = [subview convertPoint:point fromView:self];
////        UIView *hitview = [subview hitTest:convertPoint withEvent:event];
////        if (hitview != nil) {
////            return hitview;
////        }
////    }
////    return self;
//    UIView *result = [super hitTest:point withEvent:event];
//    NSLog(@"%@",result);
//    return result;
//}
//
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    BOOL result = [super pointInside:point withEvent:event];
//    return result;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"CBView touchesBegan");
    [super touchesBegan:touches withEvent:event];
}

@end

