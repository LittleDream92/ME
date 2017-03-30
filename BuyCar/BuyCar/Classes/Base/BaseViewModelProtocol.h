//
//  BaseViewModelProtocol.h
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseViewModel;
@protocol BaseViewModelProtocol <NSObject>

//push 和 pop 相关

- (void)pushViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated;

- (void)popViewControllerWithAnimation:(BOOL)animated;

- (void)popToRootViewModelWithAnimation:(BOOL)animated;

- (void)presentViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated complete:(void(^)())complete;

//模态弹出VC，用于alert
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void(^)())complete;


@end
