//
//  LoginViewModel.m
//  BuyCar
//
//  Created by Meng Fan on 17/3/30.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "LoginViewModel.h"
#import "RegistViewModel.h"
#import "ChangePwdViewModel.h"

@interface LoginViewModel ()

//是否可以点击登录按钮
@property(nonatomic, strong) RACSignal *loginEnableSignal;

@end


@implementation LoginViewModel

-(instancetype)initWithProtocol:(id<BaseViewModelProtocol>)protocol params:(NSDictionary *)params {
    self = [super initWithProtocol:protocol params:params];
    
    if (self) {
        [self setupViewModel];
    }
    return self;
}

- (void)setupViewModel {
    
/*  [self.loginCommand.executionSignals.switchToLatest subscribeNext:^(NSArray *subscriberArr) {
        
        NSLog(@"网络请求之后:%@", subscriberArr);
        
    }]; */
    
    //注册
    self.registSubject = [RACSubject subject];
    [self.registSubject subscribeNext:^(id x) {
        
//        NSLog(@"注册");
        RegistViewModel *viewModel = [[RegistViewModel alloc] initWithProtocol:self.services params:@{@"title":@"注册"}];
        self.naviImpl.className = @"RegistViewController";
        [self.naviImpl pushViewModel:viewModel animated:YES];
        
    }];
    
    
    //忘记密码
    self.forgetPwdSubject = [RACSubject subject];
    [self.forgetPwdSubject subscribeNext:^(id x) {
        
//        NSLog(@"忘记密码");
        ChangePwdViewModel *viewModel = [[ChangePwdViewModel alloc] initWithProtocol:self.services params:@{@"title":@"修改密码"}];
        self.naviImpl.className = @"ChangePwdViewController";
        [self.naviImpl pushViewModel:viewModel animated:YES];
    }];
    
    
    //获取验证码
    self.sendCodeSubject = [RACSubject subject];
    [self.sendCodeSubject subscribeNext:^(id x) {
        
        NSLog(@"获取验证码");
        
    }];
}


#pragma mark - lazyLoading
/**
 *  登录的逻辑，两个接口：登录和用户信息
 *  登录接口返回 token，用户信息返回手机号、姓名和头像（暂无）
 *  两个接口嵌套进行网络请求，都请求成功才会去处理数据
 */
-(RACCommand *)loginCommand {
    if (!_loginCommand) {
        
        @weakify(self);
        _loginCommand = [[RACCommand alloc] initWithEnabled:self.loginEnableSignal signalBlock:^RACSignal *(id input) {
            @strongify(self);
            
            SHOW_SVP(@"正在登录");
            
            RACSignal *signal = [RequestManager postWithURL:USERLOGIN parameter:@{}];
            [signal subscribeNext:^(id x) {
                NSLog(@"要登录请求啦:%@", x);
                [SVProgressHUD dismiss];
            }];
            
            
            return signal;
        }];
    }
    return _loginCommand;
}


/**
 *  登录命令的触发条件
 *  目前只判断了账号为11位，密码（验证码不为空），还没有用正则表达式判断，是否为正确的手机号码类型
 */
-(RACSignal *)loginEnableSignal {
    if (!_loginEnableSignal) {
        
        _loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self, tel), RACObserve(self, pwd)] reduce:^id(NSString *account, NSString *pwd){
            return @((account.length == 11) && pwd.length);
        }];
    }
    return _loginEnableSignal;
}

@end
