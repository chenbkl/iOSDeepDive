//
//  CBView.m
//  CBUIKitDebug
//
//  Created by 陈彬 on 2025/10/7.
//

#import "CBView.h"

@implementation CBView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *result = [super hitTest:point withEvent:event];
    return result;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL result = [super pointInside:point withEvent:event];
    return result;
}

@end
  
