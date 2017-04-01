//
//  LoginView.h
//  BuyCar
//
//  Created by Meng Fan on 17/3/31.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKTextField.h"

@class LoginViewModel;
@interface LoginView : UIView

@property (nonatomic, strong) LoginViewModel *viewModel;

@property (nonatomic, strong) DKTextField *telTextField;
@property (nonatomic, strong) DKTextField *pwdTextField;

@property (nonatomic, strong) UIButton *sendCodeBtn;
@property (nonatomic, strong) UIButton *forgotPWDBtn;

@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registBtn;


@end
