//
//  LoginViewModel.m
//  BuyCar
//
//  Created by Meng Fan on 17/3/30.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

-(instancetype)initWithProtocol:(id<BaseViewModelProtocol>)protocol params:(NSDictionary *)params {
    self = [super initWithProtocol:protocol params:params];
    
    if (self) {
        [self setupViewModel];
    }
    return self;
}

- (void)setupViewModel {
    //登录
    self.loginSubject = [RACSubject subject];
    [self.loginSubject subscribeNext:^(id x) {
        
        NSLog(@"登录");
        
    }];
    
    
    //注册
    self.registSubject = [RACSubject subject];
    [self.registSubject subscribeNext:^(id x) {
        
        NSLog(@"注册");
        
    }];
    
    
    //忘记密码
    self.forgetPwdSubject = [RACSubject subject];
    [self.forgetPwdSubject subscribeNext:^(id x) {
        
        NSLog(@"忘记密码");
        
    }];
    
    
    //获取验证码
    self.sendCodeSubject = [RACSubject subject];
    [self.sendCodeSubject subscribeNext:^(id x) {
        
        NSLog(@"获取验证码");
        
    }];
}

@end
