//
//  CBPerson.m
//  RuntimeDebug
//
//  Created by chenbin on 9/29/25.
//

#import "CBPerson.h"
#import <objc/runtime.h>

@implementation CBPerson


//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    class_addMethod(self, sel, (IMP)eatImpl, "");
//    return [super resolveInstanceMethod:sel];
//}
//
void eatImpl(id self,SEL sel){
    NSLog(@"正在吃东西");
}
//
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    return [super forwardingTargetForSelector:aSelector];
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMethodSignature signatureWithObjCTypes:"v@"];
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@",anInvocation.target);
    [anInvocation invokeUsingIMP:(IMP)eatImpl];
}

@end
