//
//  ZMHLoadFailedView.h
//  tokenApp
//
//  Created by ant_huizi on 2017/4/7.
//  Copyright © 2017年 ane56. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMHLoadFailedView : UIView


@property (weak, nonatomic) IBOutlet UIButton *retryBtn;
@property (weak, nonatomic) IBOutlet UILabel *failedTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *touchretryBtn;



@property (nonatomic, assign) UIEdgeInsets edgeInset;

@property (nonatomic, copy) void (^retryHandle)(void);

/*******加载失败********/
+ (void)showLoadFailedInView:(UIView *)view;

+ (void)showLoadFailedInView:(UIView *)view retryHandle: (void (^)(void))retryHandle;

+ (void)showLoadFailedInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset;

+ (void)showLoadFailedInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset retryHandle: (void (^)(void))retryHandle;

+ (void)showLoadFailedInView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset retryHandle: (void (^)(void))retryHandle message:(NSString *)message;

+ (void)hideLoadFailedForView:(UIView *)view;

+ (ZMHLoadFailedView *)loadFailedForView:(UIView *)view;

- (void)showInView:(UIView *)view;

- (void)hide;



@end
