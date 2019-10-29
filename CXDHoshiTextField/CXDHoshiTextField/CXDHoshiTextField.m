//
//  CXDHoshiTextField.m
//  Schedule
//
//  Created by xiao zude on 2019/3/5.
//  Copyright © 2019年 cxd. All rights reserved.
//

#import "CXDHoshiTextField.h"


@interface CXDHoshiTextField () <UITextFieldDelegate>

@property (nonatomic, strong) CALayer *inactiveBorderLayer;
@property (nonatomic, strong) CALayer *activeBorderLayer;
@property (nonatomic, assign) CGFloat borderThicknessActive;
@property (nonatomic, assign) CGFloat borderThicknessInactive;

@end


@implementation CXDHoshiTextField
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    _litFontSize = 13;
    _titleFontSize = 15;
    _borderThicknessActive = 0.5;
    _borderThicknessInactive = 0.5;
    _borderActiveColor = CXDDetailColor;
    _borderInactiveColor = CXDCCCGrayColor;
    _inactiveBorderLayer = [[CALayer alloc] init];
    _activeBorderLayer = [[CALayer alloc] init];
    _placeholderLabel = [[UILabel alloc] init];
    
    self.delegate = self;
    _placeholderLabel.frame = CGRectMake(0, self.height - 25, self.width, 25);
    _placeholderLabel.font = [UIFont systemFontOfSize:_titleFontSize];
    _placeholderLabel.textColor = CXDCCCGrayColor;
    [self addSubview:_placeholderLabel];
    
    [RACObserve(self, text) subscribeNext:^(NSString *  _Nullable x) {
        if (x.length == 0 && ![self isFirstResponder]) {
            [self animateViewsForTextDisplay];
        } else {
            [self animateViewsForTextEntry];
        }
    }];
    
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tintColor = CXDTitleColor;
    self.textColor = CXDTitleColor;
}


- (void)drawRect:(CGRect)rect {
    [self updateBorder];
    [self updatePlaceholder];
    [self.layer addSublayer:_inactiveBorderLayer];
    [self.layer addSublayer:_activeBorderLayer];
}

- (void)animateViewsForTextEntry {
    if (self.text.length > 0 && self.isFirstResponder) {
        return;
    }
    @weakify(self);
    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        @strongify(self);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.placeholderLabel.y = 3;
            self.placeholderLabel.font = [UIFont systemFontOfSize:self.litFontSize];
            self.placeholderLabel.textColor = CXDDetailColor;
        });
        
    } completion:^(BOOL finished) {
        
    }];
    [self updateBorder];
}

- (void)animateViewsForTextDisplay {
    if (self.text.length == 0) {
        @weakify(self);
        [UIView animateWithDuration:0.35 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            @strongify(self);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.placeholderLabel.y = self.height - 25;
                self.placeholderLabel.font = [UIFont systemFontOfSize:self.titleFontSize];
                self.placeholderLabel.textColor = CXDCCCGrayColor;
            });
        } completion:^(BOOL finished) {
            
        }];
    }
    [self updateBorder];
}

//更新底部线条的展示
- (void)updateBorder {
    @weakify(self);
    dispatch_async(dispatch_get_main_queue(), ^{
        @strongify(self);
        self.inactiveBorderLayer.frame = [self rectForBorderWithThickness:self.borderThicknessInactive isFilled:!self.isFirstResponder];
        self.inactiveBorderLayer.backgroundColor = self.borderInactiveColor.CGColor;
        self.activeBorderLayer.frame = [self rectForBorderWithThickness:self.borderThicknessActive isFilled:self.isFirstResponder];
        self.activeBorderLayer.backgroundColor = self.borderActiveColor.CGColor;
    });
}

- (void)updatePlaceholder {
    self.placeholderLabel.width = self.width - 30;
}

- (CGRect)rectForBorderWithThickness:(CGFloat)thickness isFilled:(BOOL)isFilled {
    if (isFilled) {
        return CGRectMake(0, self.height - thickness, self.width, thickness);
    } else {
        return CGRectMake(0, self.height - thickness, 0, thickness);
    }
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect textRect = [super textRectForBounds:bounds];
    textRect.origin.y += 12;
    return textRect;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect textRect = [super textRectForBounds:bounds];
    textRect.origin.y += 12;
    return textRect;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self animateViewsForTextEntry];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self animateViewsForTextDisplay];
}

@end
