//
//  CBButton.m
//  CBUIKitDebug
//
//  Created by chenbin on 10/9/25.
//

#import "CBButton.h"

@implementation CBButton

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonTouch)];
    [self addGestureRecognizer:tap];
    
    [self addTarget:self action:@selector(TouchUpInside) forControlEvents:UIControlEventTouchDown];
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self addTarget:self action:@selector(TouchUpInside) forControlEvents:UIControlEventTouchUpInside];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonTouch)];
//        [self addGestureRecognizer:tap];
//    }
//    return self;
//}

- (void)buttonTouch {
    NSLog(@"CBButton UITapGestureRecognizer");
}

- (void)TouchUpInside {
    NSLog(@"CBButton UIControlEventTouchUpInside");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"CBButton touchesBegan begin");
    [super touchesBegan:touches withEvent:event];
    NSLog(@"CBButton touchesBegan end");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"CBButton touchesMoved begin");
    [super touchesMoved:touches withEvent:event];
    NSLog(@"CBButton touchesMoved end");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"CBButton touchesCancelled begin");
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"CBButton touchesCancelled end");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"CBButton touchesEnded begin");
    [super touchesEnded:touches withEvent:event];
    NSLog(@"CBButton touchesEnded end");
}



@end
