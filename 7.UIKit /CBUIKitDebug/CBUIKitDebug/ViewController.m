//
//  ViewController.m
//  CBUIKitDebug
//
//  Created by 陈彬 on 2025/10/7.
//

#import "ViewController.h"
#import "CBView.h"
#import "CBViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@",self.view.superview);
    NSLog(@"%@",self.nextResponder);
    NSLog(@"%@",self.view.superview.nextResponder);

//    UIResponder * resp = self.view.nextResponder;
//    while (resp) {
//        NSLog(@"%@",resp);
//        resp = resp.nextResponder;
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIResponder * resp = self.view.nextResponder;
    while (resp) {
        NSLog(@"%@",resp);
        resp = resp.nextResponder;
    }
    NSLog(@"==============");
//    NSLog(@"%@",self.view);
//    NSLog(@"%@",self.view.superview);
//    NSLog(@"%@",self.view.superview.nextResponder);
//    NSLog(@"%@",self.view.nextResponder);
//    NSLog(@"%@",self.nextResponder);
//    NSLog(@"%@",self.navigationController);
//    CBView *view1 = [[CBView alloc]init];
//    [self.view addSubview:view1];
//    view1.frame = CGRectMake(100, 200, 100, 100);
//    view1.backgroundColor = UIColor.redColor;
//    
//    CBView *view2 = [[CBView alloc]init];
//    [self.view addSubview:view2];
//    view2.frame = CGRectMake(100, 200, 100, 100);
//    view2.backgroundColor = UIColor.redColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"ViewController touchesBegan");
    CBViewController *vc = [[CBViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
//    [super touchesBegan:touches withEvent:event];
}


@end
