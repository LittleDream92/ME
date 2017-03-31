//
//  LoginView.m
//  BuyCar
//
//  Created by Meng Fan on 17/3/31.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "LoginView.h"
#import "CustomButtonView.h"

@interface LoginView () <CustomButtonProtocol>

@property (nonatomic, strong) CustomButtonView *controlView;

@end


@implementation LoginView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupViews];
    }
    return self;
}

#pragma mark - UI
- (void)setupViews {
    
    [self addSubview:self.controlView];
    
    [self addSubview:self.telTextField];
    [self addSubview:self.pwdTextField];
    
    [self addSubview:self.sendCodeBtn];
    [self addSubview:self.forgotPWDBtn];
    
    [self addSubview:self.loginBtn];
    [self addSubview:self.registBtn];
    
    self.telTextField.frame = CGRectMake(30, CGRectGetMaxY(self.controlView.frame), kWidth-30*2, 41);
    self.pwdTextField.frame = CGRectMake(30, CGRectGetMaxY(self.telTextField.frame)-1, kWidth-30*2, 41);
    
    self.loginBtn.frame = CGRectMake(45, 260, kWidth-45*2, 41);
    self.registBtn.frame = CGRectMake(45, CGRectGetMaxY(self.loginBtn.frame)+10, kWidth-45*2, 41);
    
    self.sendCodeBtn.hidden = YES;
    self.sendCodeBtn.frame = CGRectMake(kWidth-120-31, CGRectGetMinY(self.pwdTextField.frame), 120, 41);
    self.forgotPWDBtn.frame = CGRectMake(kWidth-80-30, CGRectGetMaxY(self.pwdTextField.frame), 80, 30);

}

#pragma mark - action
//代理协议
-(void)getTag:(NSInteger)tag {
    NSInteger index = tag - 1501;
    
    if (index == 0) {
        NSLog(@"密码登录");
        self.forgotPWDBtn.hidden = NO;
        self.sendCodeBtn.hidden = YES;
        
        self.pwdTextField.placeholder = @"请输入密码";
        
    }else {
        NSLog(@"验证码登录");
        
        self.forgotPWDBtn.hidden = YES;
        self.sendCodeBtn.hidden = NO;
        
        self.pwdTextField.placeholder = @"请输入验证码";
    }
}

#pragma mark - lazyLoading
//controlView
-(CustomButtonView *)controlView {
    if (!_controlView) {
        _controlView = [[CustomButtonView alloc] initWithFrame:CGRectMake(30, 58, kWidth-30*2, 41)];
        _controlView.myDelegate = self;
        
        CGFloat buttonW = (kWidth-30*2)/2;
        [_controlView createWithImgNameArr:nil selectImgNameArr:nil buttonW:buttonW];
        _controlView.isCondationChooseCar = YES;
        [_controlView _initButtonViewWithMenuArr:@[@"密码登录",@"动态登录"]
                                       textColor:[UIColor grayColor]
                                 selectTextColor:THEME_COLOR
                                  fontSizeNumber:16
                                        needLine:YES];
    }
    return _controlView;
}

//textField
-(DKTextField *)telTextField {
    if (!_telTextField) {
        _telTextField = [[DKTextField alloc] init];
        _telTextField.placeholder = @"请输入11位手机号";
        [_telTextField setBackground:[UIImage imageNamed:@"textField_bg"]];
        
        _telTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_tel"]];
        _telTextField.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _telTextField;
}

-(DKTextField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [[DKTextField alloc] init];
        _pwdTextField.placeholder = @"请输入密码";
        [_pwdTextField setBackground:[UIImage imageNamed:@"textField_bg"]];
        
        _pwdTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_pwd"]];
        _pwdTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _pwdTextField;
}


//发送验证码按钮
-(UIButton *)sendCodeBtn {
    if (!_sendCodeBtn) {
        _sendCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendCodeBtn setTitle:@"获取动态密码" forState:UIControlStateNormal];
        [_sendCodeBtn setTitleColor:THEME_COLOR forState:UIControlStateNormal];
        _sendCodeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_sendCodeBtn setBackgroundImage:[UIImage imageNamed:@"textField_bg"] forState:UIControlStateNormal];
        [_sendCodeBtn setBackgroundImage:[UIImage imageNamed:@"textField_bg"] forState:UIControlStateHighlighted];
    }
    return _sendCodeBtn;
}


//忘记密码按钮
-(UIButton *)forgotPWDBtn {
    if (!_forgotPWDBtn) {
        _forgotPWDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgotPWDBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_forgotPWDBtn setTitleColor:THEME_COLOR forState:UIControlStateNormal];
        _forgotPWDBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _forgotPWDBtn;
}


//登录按钮
-(UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"login_normal"] forState:UIControlStateNormal];
        
    }
    return _loginBtn;
}


//注册按钮
-(UIButton *)registBtn {
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_registBtn setTitleColor:DKCOLOR(170, 170, 170, 1) forState:UIControlStateNormal];
        [_registBtn setBackgroundImage:[UIImage imageNamed:@"regist_normal"] forState:UIControlStateNormal];
    }
    return _registBtn;
}

#pragma mark -

@end
