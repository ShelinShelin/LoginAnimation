//
//  XLAnimationTextField.m
//  LoginAnimation
//
//  Created by Shelin on 16/7/18.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "XLAnimationTextField.h"

@interface XLAnimationTextField () <UITextFieldDelegate>

@end

@implementation XLAnimationTextField {
    UITextField *_textField;
    CAShapeLayer *_lineLayer;
    CAShapeLayer *_tickLayer;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        _themeColor = [UIColor colorWithRed:0.00f green:0.53f blue:1.00f alpha:1.00f];
        
        _textField = [[UITextField alloc] init];
        _textField.placeholder = @"请输入账号";
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.textColor = [UIColor lightGrayColor];
        _textField.delegate = self;
        [self addSubview:_textField];
        
        _lineLayer = [[CAShapeLayer alloc] init];
        _lineLayer.lineCap = kCALineCapRound;
        _lineLayer.lineJoin = kCALineJoinRound;
        _lineLayer.lineWidth = 2.0;
        _lineLayer.strokeColor = _themeColor.CGColor;
        _lineLayer.fillColor = [UIColor clearColor].CGColor;
        
        _tickLayer = [[CAShapeLayer alloc] init];
        _tickLayer.lineCap = kCALineCapRound;
        _tickLayer.lineJoin = kCALineJoinRound;
        _tickLayer.lineWidth = 2.0;
        _tickLayer.strokeColor = _themeColor.CGColor;
        _tickLayer.fillColor = [UIColor clearColor].CGColor;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _textField.frame = CGRectMake(0, 10, self.frame.size.width - 50, 50);
    
    UIBezierPath *linePath = [[UIBezierPath alloc] init];
    [linePath moveToPoint:CGPointMake(0, 60)];
    [linePath addLineToPoint:CGPointMake(self.frame.size.width - 20, 60)];
    
    _lineLayer.path = linePath.CGPath;
    

    UIBezierPath *roundPath = [[UIBezierPath alloc] init];
    [roundPath addArcWithCenter:CGPointMake(self.frame.size.width - 30, 30) radius:30 startAngle:(M_PI / 2.0) endAngle:M_PI * 3 / 2.0 clockwise:NO];
    
    UIBezierPath *curvePath = [[UIBezierPath alloc] init];
    [curvePath moveToPoint:CGPointMake(self.frame.size.width - 30, 0)];
    [curvePath addQuadCurveToPoint:CGPointMake(self.frame.size.width - 37, 32) controlPoint:CGPointMake(self.frame.size.width - 50, 3)];
    [roundPath appendPath:curvePath];
    
    UIBezierPath *tickPath = [[UIBezierPath alloc] init];
    
    [tickPath moveToPoint:CGPointMake(self.frame.size.width - 37, 32)];
    [tickPath addLineToPoint:CGPointMake(self.frame.size.width - 33, 40)];
    [tickPath addLineToPoint:CGPointMake(self.frame.size.width - 22, 23)];
    [roundPath appendPath:tickPath];
    
    _tickLayer.path = roundPath.CGPath;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.layer addSublayer:_lineLayer];
    [_tickLayer removeFromSuperlayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 0.3;
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    [_lineLayer addAnimation:animation forKey:@"strokeAnimation_1"];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (!textField.text.length) return;
        
    [self.layer addSublayer:_tickLayer];
    
    CABasicAnimation *animation_1 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation_1.fillMode = kCAFillModeForwards;
    animation_1.removedOnCompletion = NO;
    animation_1.duration = 0.5;
    animation_1.fromValue = @0.0;
    animation_1.toValue = @0.82;
    [_tickLayer addAnimation:animation_1 forKey:@"strokeAnimation_2"];
    
    CABasicAnimation *animation_2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation_2.fillMode = kCAFillModeForwards;
    animation_2.removedOnCompletion = NO;
    animation_2.duration = 0.2;
    animation_2.fromValue = @0.0;
    animation_2.toValue = @1;
    [_tickLayer addAnimation:animation_2 forKey:@"strokeAnimation_3"];

}

@end
