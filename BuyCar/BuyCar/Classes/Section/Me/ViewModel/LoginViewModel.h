//
//  LoginViewModel.h
//  BuyCar
//
//  Created by Meng Fan on 17/3/30.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseViewModel.h"

@interface LoginViewModel : BaseViewModel


@property (nonatomic, copy) NSString *tel;
@property (nonatomic, copy) NSString *pwd;

//登录
@property (nonatomic, strong) RACCommand *loginCommand;

//注册
@property (nonatomic, strong) RACSubject *registSubject;


//获取验证码
@property (nonatomic, strong) RACSubject *sendCodeSubject;


//忘记密码
@property (nonatomic, strong) RACSubject *forgetPwdSubject;

@end
