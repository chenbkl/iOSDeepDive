//
//  ViewController.m
//  CBRunloopDebug
//
//  Created by chenbin on 9/13/25.
//

#import "ViewController.h"
#import "CBViewController.h"
#import <CoreFoundation/CoreFoundation.h>

@interface ViewController ()

@property(nonatomic,weak)NSRunLoop *runLoop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self keepAliveThread];
}

- (void)keepAliveThread{
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        self.runLoop = runLoop;
        // 添加一个空的 Port，保证 RunLoop 有事件源
//        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
//        [runLoop performBlock:^{
//            NSLog(@"runLoop添加任务");
//        }];
        
        while (!thread.isCancelled) {
            @autoreleasepool {
                NSLog(@"循环一直在执行");
//                 跑一圈 RunLoop，等待事件
                [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            [runLoop getCFRunLoop];
        }
        NSLog(@"runLoop退出，线程结束");
    }];
    [thread start];
}


static CFRunLoopObserverRef observer;
static CFAbsoluteTime beforeSourceTime;

//void CBRunLoopCallBack(CFRunLoopObserverRef observer,
//                       CFRunLoopActivity activity,
//                       void *info) {
//    switch (activity) {
//        case kCFRunLoopEntry:
//            printf("➡️ RunLoop Entry\n");
//            break;
//        case kCFRunLoopBeforeTimers:
//            printf("⏱ RunLoop Before Timers\n");
//            break;
//        case kCFRunLoopBeforeSources:
//            printf("🔹 RunLoop Before Sources\n");
//            break;
//        case kCFRunLoopBeforeWaiting:
//            printf("💤 RunLoop Before Waiting\n");
//            break;
//        case kCFRunLoopAfterWaiting:
//            printf("☀️ RunLoop After Waiting\n");
//            break;
//        case kCFRunLoopExit:
//            printf("❌ RunLoop Exit\n");
//            break;
//        default:
//            printf("❓ Unknown activity: %lu\n", activity);
//            break;
//    }
//}

void CBRunLoopCallBack(CFRunLoopObserverRef observer,CFRunLoopActivity activity,void *info){
    if (activity == kCFRunLoopBeforeSources) {
        printf("kCFRunLoopBeforeSources\n");
        beforeSourceTime = CFAbsoluteTimeGetCurrent();
    }else if (activity == kCFRunLoopBeforeWaiting){
        printf("kCFRunLoopBeforeWaiting\n");
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        CFAbsoluteTime cost = now-beforeSourceTime;
        if (cost>0.1) {
            printf("检测到主线程卡顿,时间消耗:%f\n",cost);
        }
    }
}

- (void)startMonitor {
    CFRunLoopObserverContext context = {
        0,(__bridge void *)self,NULL,NULL,NULL
    };
    observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, CBRunLoopCallBack, &context);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);
}

- (IBAction)click:(id)sender {
    [self addTaskToSubThread];
}

- (void)addTaskToSubThread{
    [self.runLoop performBlock:^{
        NSLog(@"runLoop添加xin任务");
    }];
}

//用于捕获卡顿
- (void)runPushTaskCatchKaDun{
    NSLog(@"开始耗时任务");
    [NSThread sleepForTimeInterval:0.1]; // 主线程阻塞 0.5 秒
    NSLog(@"耗时任务结束");
    [self.navigationController pushViewController:[[CBViewController alloc]init] animated:YES];
    NSLog(@"按钮点击结束");
    
    [[NSRunLoop currentRunLoop]runUntilDate:[NSDate distantFuture]];
}


@end
