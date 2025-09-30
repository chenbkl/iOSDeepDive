//
//  ViewController.m
//  RuntimeDebug
//
//  Created by chenbin on 9/29/25.
//

#import "ViewController.h"
#import "CBPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i<1000000000000; i++) {
        CBPerson *person = [[CBPerson alloc]init];
    }
    NSLog(@"viewDidLoad");
}


@end
