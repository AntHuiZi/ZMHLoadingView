//
//  ZMHLoadFailedView.m
//  tokenApp
//
//  Created by ant_huizi on 2017/4/7.
//  Copyright © 2017年 ane56. All rights reserved.
//

//绘制1px的线
#define SINGLE_LINE_WIDTH  (1.0 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET  ((1.0 / [UIScreen mainScreen].scale) / 2)


#import "ZMHLoadFailedView.h"

@implementation ZMHLoadFailedView

+ (instancetype)loadViewFromNib
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    return [nib objectAtIndex:0];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    _edgeInset = UIEdgeInsetsZero;
    
}

#pragma mark - action

- (IBAction)retryAction:(id)sender {
    if (_retryHandle) {
        _retryHandle();
    }
    [self hide];
}


- (IBAction)touchretryBtnClick:(UIButton *)sender {
    if (_retryHandle) {
        _retryHandle();
    }
    [self hide];
}


#pragma mark - 便利方法

+ (void)showLoadFailedInView:(UIView *)view
{
    [self showLoadFailedInView:view edgeInset:UIEdgeInsetsZero];
}

+ (void)showLoadFailedInView:(UIView *)view retryHandle: (void (^)(void))retryHandle
{

    [self showLoadFailedInView:view edgeInset:UIEdgeInsetsZero retryHandle:retryHandle];
}

+ (void)showLoadFailedInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset
{
    [self showLoadFailedInView:view edgeInset:edgeInset retryHandle:nil];
}

+ (void)showLoadFailedInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset retryHandle: (void (^)(void))retryHandle
{
    
    ZMHLoadFailedView *loadFailed = [self loadFailedForView:view];
    if (loadFailed) {
        [loadFailed hide];
        
    }
    
    ZMHLoadFailedView *loadFailedView = [self loadViewFromNib];
    loadFailedView.touchretryBtn.layer.cornerRadius = 4.0f;
    loadFailedView.touchretryBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loadFailedView.touchretryBtn.layer.borderWidth = SINGLE_LINE_WIDTH;
    [loadFailedView.touchretryBtn clipsToBounds];
    loadFailedView.edgeInset = edgeInset;
    loadFailedView.retryHandle = retryHandle;
    NSLog(@"%ld",retryHandle?YES:NO);
    [loadFailedView isShowRetury:retryHandle?YES:NO];
    
    [loadFailedView showInView:view];
}

+ (void)showLoadFailedInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset retryHandle: (void (^)(void))retryHandle message:(NSString *)message {
    ZMHLoadFailedView *loadFailed = [self loadFailedForView:view];
    if (loadFailed) {
        [loadFailed hide];
        
    }
    
    ZMHLoadFailedView *loadFailedView = [self loadViewFromNib];
    loadFailedView.touchretryBtn.layer.cornerRadius = 4.0f;
    loadFailedView.touchretryBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loadFailedView.touchretryBtn.layer.borderWidth = SINGLE_LINE_WIDTH;
    [loadFailedView.touchretryBtn clipsToBounds];
    loadFailedView.edgeInset = edgeInset;
    loadFailedView.retryHandle = retryHandle;
    loadFailedView.failedTitleLabel.text = message;
    
    [loadFailedView showInView:view];
    
}

- (void)isShowRetury:(BOOL)showRetury {
    if (showRetury) {
        self.touchretryBtn.hidden = NO;
        self.retryBtn.userInteractionEnabled = YES;
    } else {
        self.touchretryBtn.hidden = YES;
        self.retryBtn.userInteractionEnabled = NO;
    }
}

+ (void)hideLoadFailedForView:(UIView *)view
{
    ZMHLoadFailedView *loadFailedView = [self loadFailedForView:view];
    if (loadFailedView) {
        [loadFailedView hide];
    }
    //    [LPLoadingView hideLoadingForView:view];
}

+ (ZMHLoadFailedView *)loadFailedForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            return (ZMHLoadFailedView *)subview;
        }
    }
    return nil;
}

#pragma mark - 实例方法

- (void)showInView:(UIView *)view
{
    if (!view) {
        return ;
    }
    if (self.superview != view) {
        
        [self removeFromSuperview];
        [view addSubview:self];
        
        [view bringSubviewToFront:self];
        
        
        [self addConstraintInView:view edgeInset:_edgeInset];
    }
}

- (void)addConstraintInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:edgeInset.top]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:edgeInset.left]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:edgeInset.right]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:edgeInset.bottom]];
}

- (void)hide
{
    self.alpha = 1.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
