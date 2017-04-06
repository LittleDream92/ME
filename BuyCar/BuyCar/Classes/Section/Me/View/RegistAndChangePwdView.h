//
//  RegistAndChangePwdView.h
//  BuyCar
//
//  Created by Meng Fan on 17/3/31.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DKTextField;
@interface RegistAndChangePwdView : UIView

@property (nonatomic, strong) DKTextField *telTextFiled;
@property (nonatomic, strong) DKTextField *pwdTextField;
@property (nonatomic, strong) UITextField *rePwdTextField;
@property (nonatomic, strong) DKTextField *codeTextField;

@property (nonatomic, strong) UIButton *getCodeBtn;

@property (nonatomic, strong) DKTextField *nameTextField;

//自定义初始化方法
-(instancetype)initWithFrame:(CGRect)frame isRegist:(BOOL)isRegist;

@end
