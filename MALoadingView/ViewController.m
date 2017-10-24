//
//  ViewController.m
//  MALoadingView
//
//  Created by xindong on 17/10/24.
//  Copyright © 2017年 xindong. All rights reserved.
//

#import "ViewController.h"
#import "MALoadingView.h"

@interface ViewController ()

@property (nonatomic, strong) MALoadingView *loadingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loadingView = [[MALoadingView alloc] initWithFrame:CGRectMake(0, 0, 150, 120)];
    self.loadingView.center = self.view.center;
    self.loadingView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.loadingView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touched");
    [self.loadingView startLoading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
