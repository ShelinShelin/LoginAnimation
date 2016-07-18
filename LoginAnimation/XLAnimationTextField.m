//
//  XLAnimationTextField.m
//  LoginAnimation
//
//  Created by Shelin on 16/7/18.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "XLAnimationTextField.h"
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface XLAnimationTextField () <UITextFieldDelegate>

@end

@implementation XLAnimationTextField {
    UITextField *_AccounTextField;
    UITextField *_pwdTextField;
    CAShapeLayer *_lineLayer;
    CAShapeLayer *_tickLayer;
    CAShapeLayer *_pwdLayer;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        _themeColor = [UIColor colorWithRed:0.00f green:0.53f blue:1.00f alpha:1.00f];
        
        _AccounTextField = [[UITextField alloc] init];
        _AccounTextField.placeholder = @"Email";
        _AccounTextField.borderStyle = UITextBorderStyleNone;
        _AccounTextField.textColor = [UIColor blackColor];
        _AccounTextField.delegate = self;
        [self addSubview:_AccounTextField];
        
        _pwdTextField = [[UITextField alloc] init];
        _pwdTextField.secureTextEntry = YES;
        _pwdTextField.placeholder = @"Password";
        _pwdTextField.borderStyle = UITextBorderStyleNone;
        _pwdTextField.textColor = [UIColor blackColor];
        _pwdTextField.delegate = self;
        [self addSubview:_pwdTextField];
        
        _lineLayer = [[CAShapeLayer alloc] init];
        _lineLayer.lineCap = kCALineCapRound;
        _lineLayer.lineJoin = kCALineJoinRound;
        _lineLayer.lineWidth = 1.5;
        _lineLayer.strokeColor = _themeColor.CGColor;
        _lineLayer.fillColor = [UIColor clearColor].CGColor;
        
        _tickLayer = [[CAShapeLayer alloc] init];
        _tickLayer.lineCap = kCALineCapRound;
        _tickLayer.lineJoin = kCALineJoinRound;
        _tickLayer.lineWidth = 1.5;
        _tickLayer.strokeColor = _themeColor.CGColor;
        _tickLayer.fillColor = [UIColor clearColor].CGColor;
        
        _pwdLayer = [[CAShapeLayer alloc] init];
        _pwdLayer.lineCap = kCALineCapRound;
        _pwdLayer.lineJoin = kCALineJoinRound;
        _pwdLayer.lineWidth = 1.5;
        _pwdLayer.strokeColor = _themeColor.CGColor;
        _pwdLayer.fillColor = [UIColor clearColor].CGColor;
    
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _AccounTextField.frame = CGRectMake(0, 10, self.frame.size.width - 50, 50);
    _pwdTextField.frame = CGRectMake(0, CGRectGetMaxY(_AccounTextField.frame) + 10, self.frame.size.width - 50, 50);
    
    UIBezierPath *linePath_1 = [[UIBezierPath alloc] init];
    [linePath_1 moveToPoint:CGPointMake(0, 60)];
    [linePath_1 addLineToPoint:CGPointMake(self.frame.size.width - 20, 60)];
    
    _lineLayer.path = linePath_1.CGPath;
    _lineLayer.hidden = YES;
    [self.layer addSublayer:_lineLayer];
    

    UIBezierPath *roundPath_1 = [[UIBezierPath alloc] init];
    [roundPath_1 addArcWithCenter:CGPointMake(self.frame.size.width - 30, 30) radius:30 startAngle:(M_PI / 2.0) endAngle:M_PI * 3 / 2.0 clockwise:NO];
    
    UIBezierPath *curvePath = [[UIBezierPath alloc] init];
    [curvePath moveToPoint:CGPointMake(self.frame.size.width - 30, 0)];
    [curvePath addQuadCurveToPoint:CGPointMake(self.frame.size.width - 37, 32) controlPoint:CGPointMake(self.frame.size.width - 50, 3)];
    [roundPath_1 appendPath:curvePath];
    
    UIBezierPath *tickPath = [[UIBezierPath alloc] init];
    
    [tickPath moveToPoint:CGPointMake(self.frame.size.width - 37, 32)];
    [tickPath addLineToPoint:CGPointMake(self.frame.size.width - 33, 40)];
    [tickPath addLineToPoint:CGPointMake(self.frame.size.width - 22, 23)];
    [roundPath_1 appendPath:tickPath];
    
    _tickLayer.path = roundPath_1.CGPath;
    _tickLayer.hidden = YES;
    [self.layer addSublayer:_tickLayer];
    
    UIBezierPath *roundPath_2 = [[UIBezierPath alloc] init];
    [roundPath_2 moveToPoint:CGPointMake(self.frame.size.width - 40, 60)];
    [roundPath_2 addLineToPoint:CGPointMake(self.frame.size.width - 20, 60)];
    
    [roundPath_2 addArcWithCenter:CGPointMake(self.frame.size.width - 20, 90) radius:30 startAngle:DEGREES_TO_RADIANS(270) endAngle:DEGREES_TO_RADIANS(90) clockwise:YES];
    
    UIBezierPath *linePath_2 = [[UIBezierPath alloc] init];
    [linePath_2 moveToPoint:CGPointMake(self.frame.size.width - 20, 120)];
    [linePath_2 addLineToPoint:CGPointMake(0, 120)];
    [roundPath_2 appendPath:linePath_2];
    
    _pwdLayer.path = roundPath_2.CGPath;
    _pwdLayer.hidden = YES;
    [self.layer addSublayer:_pwdLayer];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == _AccounTextField) {
        _lineLayer.hidden = NO;
        _pwdLayer.hidden = YES;
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.duration = 0.3;
        animation.fromValue = @0.0;
        animation.toValue = @1.0;
        [_lineLayer addAnimation:animation forKey:@"strokeAnimation_1"];
    }
    if (textField == _pwdTextField) {
        
        _pwdLayer.hidden = NO;
        CABasicAnimation *animation_1 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        animation_1.fillMode = kCAFillModeForwards;
        animation_1.removedOnCompletion = NO;
        animation_1.duration = 0.3;
        animation_1.fromValue = @0.0;
        animation_1.toValue = @0.25;
        [_pwdLayer addAnimation:animation_1 forKey:@"strokeAnimation_2"];
        
        CABasicAnimation *animation_2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation_2.fillMode = kCAFillModeForwards;
        animation_2.removedOnCompletion = NO;
        animation_2.duration = 0.3;
        animation_2.fromValue = @0.0;
        animation_2.toValue = @1;
        [_pwdLayer addAnimation:animation_2 forKey:@"strokeAnimation_3"];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (!textField.text.length) return;
    
    if (textField == _AccounTextField) {
        
        _tickLayer.hidden = NO;
        CABasicAnimation *animation_1 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        animation_1.fillMode = kCAFillModeForwards;
        animation_1.removedOnCompletion = NO;
        animation_1.duration = 0.4;
        animation_1.fromValue = @0.0;
        animation_1.toValue = @0.82;
        [_tickLayer addAnimation:animation_1 forKey:@"strokeAnimation_4"];
        
        CABasicAnimation *animation_2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation_2.fillMode = kCAFillModeForwards;
        animation_2.removedOnCompletion = NO;
        animation_2.duration = 0.3;
        animation_2.fromValue = @0.0;
        animation_2.toValue = @1;
        [_tickLayer addAnimation:animation_2 forKey:@"strokeAnimation_5"];
    }
    

}

@end
