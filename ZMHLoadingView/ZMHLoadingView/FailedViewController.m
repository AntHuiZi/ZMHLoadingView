//
//  FailedViewController.m
//  ZMHLoadingView
//
//  Created by 张明辉 on 2018/3/20.
//  Copyright © 2018年 Zhang Minghui. All rights reserved.
//

#import "FailedViewController.h"
#import "ZMHLoadingView.h"
#import "ZMHLoadFailedView.h"

@interface FailedViewController ()

@end

@implementation FailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)showfailedAndRetury:(UIButton *)sender {
    
    [ZMHLoadingView showLoadingInView:self.view edgeInset:UIEdgeInsetsZero message:@"加载中..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZMHLoadingView hideLoadingForView:self.view];
        
        [ZMHLoadFailedView showLoadFailedInView:self.view edgeInset:UIEdgeInsetsZero retryHandle:^{
            
            NSLog(@"received message");
            
        } message:@"加载失败了哦！"];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [ZMHLoadFailedView hideLoadFailedForView:self.view];
//        });
        
        
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
