//
//  RegistAndChangePwdView.m
//  BuyCar
//
//  Created by Meng Fan on 17/3/31.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "RegistAndChangePwdView.h"
#import "DKTextField.h"

@interface RegistAndChangePwdView ()

//是否是注册页面的视图
@property (nonatomic, assign) BOOL isRegist;

@end



@implementation RegistAndChangePwdView


-(instancetype)initWithFrame:(CGRect)frame isRegist:(BOOL)isRegist {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.isRegist = isRegist;
        [self setupViews];
    }
    return self;
}


#pragma mark - UI
- (void)setupViews {
    
    [self addSubview:self.telTextFiled];
    [self addSubview:self.pwdTextField];
    [self addSubview:self.rePwdTextField];
    [self addSubview:self.codeTextField];
    [self addSubview:self.nameTextField];
    
    [self addSubview:self.getCodeBtn];
    
    [self updateConstraintsIfNeeded];
}


#pragma mark - frame
-(void)updateConstraintsIfNeeded {
    
    CGFloat padding = 20*ZOOM_SCALL;
    CGFloat height = 40;
    CGFloat paddingY = 10;
    
    self.telTextFiled.frame = CGRectMake(padding, paddingY, kWidth-padding*2, height);
    
    if (self.isRegist) {    //注册
        
        self.pwdTextField.frame = CGRectMake(padding, CGRectGetMaxY(self.telTextFiled.frame)+paddingY, kWidth-padding*2, height);
        self.rePwdTextField.frame = CGRectMake(padding, CGRectGetMaxY(self.pwdTextField.frame)+paddingY, kWidth-padding*2, height);
        
        self.nameTextField.frame = CGRectMake(padding, CGRectGetMaxY(self.rePwdTextField.frame)+paddingY*5, kWidth-padding*2, height);
        self.codeTextField.frame = CGRectMake(padding, CGRectGetMaxY(self.nameTextField.frame)+paddingY, kWidth-padding*2, height);
        
        
    } else {    //修改密码
        self.pwdTextField.placeholder = @"请输入新密码";
        self.rePwdTextField.placeholder = @"请再次输入新密码";
        
        self.codeTextField.frame = CGRectMake(padding, CGRectGetMaxY(self.telTextFiled.frame)+paddingY, kWidth-padding*2, height);
        self.pwdTextField.frame = CGRectMake(padding, CGRectGetMaxY(self.codeTextField.frame)+paddingY, kWidth-padding*2, height);
        self.rePwdTextField.frame = CGRectMake(padding, CGRectGetMaxY(self.pwdTextField.frame)+paddingY, kWidth-padding*2, height);
        
    }
    

}




#pragma mark - lazyLoading
-(DKTextField *)telTextFiled {
    if (!_telTextFiled) {
        _telTextFiled = [[DKTextField alloc] init];
        _telTextFiled.placeholder = @"请输入11位手机号码";
        _telTextFiled.font = [UIFont systemFontOfSize:15];
        [_telTextFiled setBackground:[UIImage imageNamed:@"textField_bg"]];
    }
    return _telTextFiled;
}

-(DKTextField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [[DKTextField alloc] init];
        _pwdTextField.placeholder = @"请输入密码";
        _pwdTextField.font = [UIFont systemFontOfSize:15];
        [_pwdTextField setBackground:[UIImage imageNamed:@"textField_bg"]];
        _pwdTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_pwd"]];
    }
    return _pwdTextField;
}

-(UITextField *)rePwdTextField {
    if (!_rePwdTextField) {
        _rePwdTextField = [[UITextField alloc] init];
        _rePwdTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_pwd"]];
        _rePwdTextField.placeholder = @"请再次输入密码";
        _rePwdTextField.font = [UIFont systemFontOfSize:15];
        [_rePwdTextField setBackground:[UIImage imageNamed:@"textField_bg"]];
        
    }
    return _rePwdTextField;
}

-(DKTextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [[DKTextField alloc] init];
        _codeTextField.placeholder = @"请输入验证码";
        _codeTextField.font = [UIFont systemFontOfSize:15];
        [_codeTextField setBackground:[UIImage imageNamed:@"textField_bg"]];
        _codeTextField.backgroundColor = [UIColor cyanColor];
    }
    return _codeTextField;
}

-(UIButton *)getCodeBtn {
    if (!_getCodeBtn) {
        _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    return _getCodeBtn;
}


-(DKTextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [[DKTextField alloc] init];
        _nameTextField.placeholder = @"请输入您的真实姓名";
        _nameTextField.font = [UIFont systemFontOfSize:15];
        [_nameTextField setBackground:[UIImage imageNamed:@"textField_bg"]];
        _nameTextField.backgroundColor = [UIColor cyanColor];
    }
    return _nameTextField;
}


@end
