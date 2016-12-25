//
//  ToController.m
//  pubuliu
//
//  Created by 刘培策 on 16/12/25.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import "ToController.h"

@interface ToController ()

@end

@implementation ToController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"Cell详情";
    
    UIView *v = [[UIView alloc] init];
    
    v.bounds = CGRectMake(0, 0, 300, 300);
    
    v.center = self.view.center;
    
    v.backgroundColor = self.color;
    
    [self.view addSubview:v];
    
}

@end
