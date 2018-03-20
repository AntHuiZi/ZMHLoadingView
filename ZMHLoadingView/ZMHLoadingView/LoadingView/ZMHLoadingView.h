//
//  ZMHLoadingView.h
//  tokenApp
//
//  Created by ant_huizi on 2017/4/7.
//  Copyright © 2017年 ane56. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMHLoadingView : UIView


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indictView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (nonatomic, assign) UIEdgeInsets edgeInset;

// 便利方法

+ (void)showLoadingInView:(UIView *)view;

+ (void)showLoadingInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset;

+ (void)showLoadingInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset message:(NSString *)message;

+ (void)hideLoadingForView:(UIView *)view;

+ (void)hideAllLoadingForView:(UIView *)view;

+ (ZMHLoadingView *)loadingForView:(UIView *)view;

// 实例方法
+ (instancetype)loadViewFromNib;

- (void)showInView:(UIView *)view;

- (void)hide;




@end
