//
//  DKMeVC.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "DKMeVC.h"

@interface DKMeVC ()

//viewModel
@property (nonatomic, strong) DKMeVM *viewModel;

@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation DKMeVC
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    [self setupViews];
}
#pragma mark - UI
- (void)setupViews {
    [self.view addSubview:self.loginBtn];
}


#pragma mark - action
-(void)bindViewModel {
    [super bindViewModel];
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.viewModel.loginSubject sendNext:x];
    }];
}


#pragma mark - lazyLoading
-(UIButton *)loginBtn {
    if (!_loginBtn) {
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(20, 100, 50, 30);
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor grayColor]];
        
    }
    return _loginBtn;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
