//
//  ViewController.h
//  calculator
//
//  Created by ken on 13-5-4.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) NSMutableArray *addArray;
@property (strong, nonatomic) NSMutableArray *multiplyArray;
@property (strong, nonatomic) NSMutableArray *divisionArray;
@property (strong, nonatomic)NSString *preSymbol;
@end
