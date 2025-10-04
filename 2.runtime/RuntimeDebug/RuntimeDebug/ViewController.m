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
    
    CBPerson *person = [[CBPerson alloc]init];
    [person eat:@"apple"];
    [person eat:@"orange"];

}


@end
