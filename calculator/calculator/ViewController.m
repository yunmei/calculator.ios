//
//  ViewController.m
//  calculator
//
//  Created by ken on 13-5-4.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize displayLabel;
@synthesize addArray = _addArray;
@synthesize multiplyArray = _multiplyArray;
@synthesize divisionArray = _divisionArray;
@synthesize preSymbol;
bool ISCLEANSCREEN = YES;

- (void)viewDidLoad
{
    self.preSymbol = @"";
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitPressed:(id)sender {
    UIButton *digitButton = sender;
    if(ISCLEANSCREEN)
    {
        self.displayLabel.text = digitButton.titleLabel.text;
        ISCLEANSCREEN = NO;
    }else{
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:digitButton.titleLabel.text];
    }
    
}

- (IBAction)add:(id)sender {
        NSNumber *number = [NSNumber numberWithDouble:[[self.preSymbol stringByAppendingString:self.displayLabel.text] doubleValue]];
        NSLog(@"number%@",number);
        [self.addArray addObject:number];
        [self add];
        self.displayLabel.text = [NSString stringWithFormat:@"%f",[[self.addArray objectAtIndex:0] doubleValue]];
        ISCLEANSCREEN = YES;
        self.preSymbol = @"";
}

- (IBAction)minus:(id)sender {
    NSNumber *number = [NSNumber numberWithDouble:[[self.preSymbol stringByAppendingString:self.displayLabel.text] doubleValue]];
    [self.addArray addObject:number];
    [self add];
    self.displayLabel.text = [NSString stringWithFormat:@"%f",[[self.addArray objectAtIndex:0] doubleValue]];
    ISCLEANSCREEN = YES;
    self.preSymbol = @"-";
}
- (IBAction)multiply:(id)sender {
    NSNumber *number = [NSNumber numberWithDouble:[[self.preSymbol stringByAppendingString:self.displayLabel.text] doubleValue]];
    [self.addArray addObject:number];
    [self add];
    self.displayLabel.text = [NSString stringWithFormat:@"%f",[[self.addArray objectAtIndex:0] doubleValue]];
    ISCLEANSCREEN = YES;
    self.preSymbol = @"*";
}
- (IBAction)division:(id)sender {
    NSNumber *number = [NSNumber numberWithDouble:[[self.preSymbol stringByAppendingString:self.displayLabel.text] doubleValue]];
    [self.addArray addObject:number];
    [self add];
    self.displayLabel.text = [NSString stringWithFormat:@"%f",[[self.addArray objectAtIndex:0] doubleValue]];
    ISCLEANSCREEN = YES;
    self.preSymbol = @"/";
    
}
- (IBAction)print:(id)sender {
    ISCLEANSCREEN = YES;
    NSNumber *number;
    if([self.preSymbol isEqualToString:@"-"]||[self.preSymbol isEqualToString:@""])
    {
        number = [NSNumber numberWithDouble:[[self.preSymbol stringByAppendingString:self.displayLabel.text] doubleValue]];
    }else{
         number = [NSNumber numberWithDouble:[self.displayLabel.text doubleValue]];
    }
    [self.addArray addObject:number];
    [self add];
    self.displayLabel.text = [NSString stringWithFormat:@"%f",[[self.addArray objectAtIndex:0] doubleValue]];
    [self.addArray removeAllObjects];
    [self.addArray addObject:[NSNumber numberWithDouble:0]];
    self.preSymbol = @"";
}

- (IBAction)clean:(id)sender {
    self.displayLabel.text = @"0";
    [self.addArray removeAllObjects];
    NSNumber *number = [NSNumber numberWithDouble:0];
    [_addArray addObject:number];
    ISCLEANSCREEN = YES;
}

-(NSMutableArray *)addArray
{
    if(_addArray == nil)
    {
        _addArray = [[NSMutableArray alloc]init];
        NSNumber *number = [NSNumber numberWithDouble:0];
        [_addArray addObject:number];
    }
    return _addArray;
}

-(void)add
{
    if([self.preSymbol isEqualToString:@"*"])
    {
        double firstNumber = [[self.addArray objectAtIndex:0] doubleValue];
        double second = [[self.addArray objectAtIndex:1] doubleValue];
        double addNumber = firstNumber * second;
        [self.addArray removeAllObjects];
        [self.addArray addObject:[NSNumber numberWithDouble:addNumber]];
    }else if ([self.preSymbol isEqualToString:@"/"]){
        double firstNumber = [[self.addArray objectAtIndex:0] doubleValue];
        double second = [[self.addArray objectAtIndex:1] doubleValue];
        double addNumber = firstNumber / second;
        [self.addArray removeAllObjects];
        [self.addArray addObject:[NSNumber numberWithDouble:addNumber]];
    }else{
        double firstNumber = [[self.addArray objectAtIndex:0] doubleValue];
        double second = [[self.addArray objectAtIndex:1] doubleValue];
        double addNumber = firstNumber + second;
        [self.addArray removeAllObjects];
        [self.addArray addObject:[NSNumber numberWithDouble:addNumber]];
    }
}


@end
