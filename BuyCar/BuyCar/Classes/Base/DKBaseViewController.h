//
//  DKBaseViewController.h
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseViewModel;
@interface DKBaseViewController : UIViewController

//自定义初始化方法
- (instancetype)initWithViewModel:(BaseViewModel *)viewModle;

//绑定ViewModel
- (void)bindViewModel;

@end
