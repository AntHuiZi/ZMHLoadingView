//
//  ViewController.m
//  ZMHLoadingView
//
//  Created by 张明辉 on 2018/3/20.
//  Copyright © 2018年 Zhang Minghui. All rights reserved.
//

#import "ViewController.h"
#import "ZMHLoadingView.h"
#import "ZMHLoadFailedView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
}


- (IBAction)showLoadingview:(UIButton *)sender {
    [ZMHLoadingView showLoadingInView:self.view edgeInset:UIEdgeInsetsZero message:@"加载中..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZMHLoadingView hideLoadingForView:self.view];
    });
    
}



- (IBAction)showLoadingFailedView:(UIButton *)sender {
    
    [ZMHLoadingView showLoadingInView:self.view edgeInset:UIEdgeInsetsZero message:@"加载中..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZMHLoadingView hideLoadingForView:self.view];
        
        [ZMHLoadFailedView showLoadFailedInView:self.view edgeInset:UIEdgeInsetsZero];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ZMHLoadFailedView hideLoadFailedForView:self.view];
        });
        
        
    });
    
    
    
   
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
