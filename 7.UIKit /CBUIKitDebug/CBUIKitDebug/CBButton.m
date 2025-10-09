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
    [self addTarget:self action:@selector(TouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonTouch)];
    [self addGestureRecognizer:tap];
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
    NSLog(@"CBButton touchesBegan");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"CBButton touchesEnded");
    [super touchesEnded:touches withEvent:event];
}



@end
