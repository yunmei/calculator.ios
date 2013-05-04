//
//  ViewController.m
//  testAdd
//
//  Created by ken on 13-5-4.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *preString = @"-";
    NSString *aa = @"-5";
    NSString *bb = @"3";
    NSString *addString = [preString stringByAppendingString:bb];
    NSLog(@"%f",[addString doubleValue]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
