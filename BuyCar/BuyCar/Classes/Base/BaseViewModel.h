//
//  BaseViewModel.h
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelNavigationImpl.h"

@interface BaseViewModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong, readonly) id<BaseViewModelProtocol> services;
@property (nonatomic, copy, readonly) NSDictionary *params;

//管理跳转的对象
@property (nonatomic, strong) ViewModelNavigationImpl *naviImpl;

//自定义初始化方法(对象遵循协议)
- (instancetype)initWithProtocol:(id<BaseViewModelProtocol>)protocol params:(NSDictionary *)params;



@end
