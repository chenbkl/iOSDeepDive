//
//  ViewController.m
//  CBUIKitDebug
//
//  Created by 陈彬 on 2025/10/7.
//

#import "ViewController.h"
#import "CBView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CBView *view = [[CBView alloc]init];
    [self.view addSubview:view];
    view.frame = CGRectMake(100, 200, 100, 100);
    view.backgroundColor = UIColor.redColor;
}


@end
