//
//  ViewController.m
//  LoginAnimation
//
//  Created by Shelin on 16/7/18.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "ViewController.h"
#import "XLAnimationTextField.h"

@interface ViewController () {
    CAShapeLayer *_lineLayer;
    CAShapeLayer *_tickLayer;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XLAnimationTextField *textField = [[XLAnimationTextField alloc] init];
    textField.frame = CGRectMake(10, 100, 300, 60);
    
    [self.view addSubview:textField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
