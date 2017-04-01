//
//  LoginViewController.m
//  BuyCar
//
//  Created by Meng Fan on 17/3/30.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"

@interface LoginViewController ()

//登录视图
@property (nonatomic, strong) LoginView *loginView;

//viewModel
@property (nonatomic, strong) LoginViewModel *viewModel;

@end

@implementation LoginViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    [self setupViews];
}


#pragma mark - UI
- (void)setupViews {
    [self.view addSubview:self.loginView];
}


#pragma mark - action
-(void)bindViewModel {
    [super bindViewModel];
    
    RAC(self.viewModel, tel) = self.loginView.telTextField.rac_textSignal;
    RAC(self.viewModel, pwd) = self.loginView.pwdTextField.rac_textSignal;
    
    @weakify(self);
    self.loginView.loginBtn.rac_command = self.viewModel.loginCommand;
    
    [[self.loginView.registBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.registSubject sendNext:x];
    }];
    
    [[self.loginView.forgotPWDBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.forgetPwdSubject sendNext:x];
    }];
    
    [[self.loginView.sendCodeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.sendCodeSubject sendNext:x];
    }];
}


#pragma mark - lazyLoading
-(LoginView *)loginView {
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:self.view.bounds];
        _loginView.viewModel = self.viewModel;
    }
    return _loginView;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
