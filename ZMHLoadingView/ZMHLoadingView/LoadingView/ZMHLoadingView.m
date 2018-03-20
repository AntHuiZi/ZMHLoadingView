//
//  ZMHLoadingView.m
//  tokenApp
//
//  Created by ant_huizi on 2017/4/7.
//  Copyright © 2017年 ane56. All rights reserved.
//

#import "ZMHLoadingView.h"

@implementation ZMHLoadingView

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


#pragma mark - 便利方法

+ (void)showLoadingInView:(UIView *)view
{
    [self showLoadingInView:view edgeInset:UIEdgeInsetsZero];
}

+ (void)showLoadingInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset
{
    ZMHLoadingView *loadingView = [self loadViewFromNib];
    
    loadingView.edgeInset = edgeInset;
    
    [loadingView showInView:view];
}

+ (void)showLoadingInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset message:(NSString *)message {
    ZMHLoadingView *loadingView = [self loadViewFromNib];
    
    loadingView.edgeInset = edgeInset;
    loadingView.titleLabel.text = message;
    
    [loadingView showInView:view];
}


+ (void)hideLoadingForView:(UIView *)view
{
    if (!view) {
        view = [self zmh_getWindow];
        //        return ;
    }
    ZMHLoadingView *loadingView = [self loadingForView:view];
    if (loadingView) {
        [loadingView hide];
    }
}

+ (void)hideAllLoadingForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            [(ZMHLoadingView *)subview hideNoAnimation];
        }
    }
}

+ (ZMHLoadingView *)loadingForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            return (ZMHLoadingView *)subview;
        }
    }
    return nil;
}

#pragma mark - 实例方法

- (void)showInView:(UIView *)view
{
    if (!view) {
        view = [ZMHLoadingView zmh_getWindow];
        //        return ;
    }
    if (self.superview != view) {
        
        [self removeFromSuperview];
        
        [view addSubview:self];
        
        [view bringSubviewToFront:self];
        
        [self addConstraintInView:view edgeInset:_edgeInset];
    }
}

- (void)hide
{
    self.alpha = 1.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self hideNoAnimation];
    }];
}

- (void)hideNoAnimation
{
    //    [self.imageView stopAnimating];
    [self removeFromSuperview];
}

- (void)addConstraintInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1 constant:edgeInset.top]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1 constant:edgeInset.left]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1 constant:edgeInset.right]];
    
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:edgeInset.bottom]];
}

- (void)dealloc
{
    NSLog(@"view----加载动画view被销毁了");
}

+ (UIWindow *)zmh_getWindow {
    UIWindow *backWindow = [[UIApplication sharedApplication] keyWindow];
    if (backWindow.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                backWindow = tmpWin;
                return backWindow;
            }
        }
    } else {
        return backWindow;
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




@end
