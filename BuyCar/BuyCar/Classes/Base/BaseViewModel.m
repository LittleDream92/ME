//
//  BaseViewModel.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseViewModel ()

@property (nonatomic, strong, readwrite) id<BaseViewModelProtocol> services;
@property (nonatomic, copy, readwrite) NSDictionary *params;

@end


@implementation BaseViewModel

//自定义初始化方法(对象遵循协议)
- (instancetype)initWithProtocol:(id<BaseViewModelProtocol>)protocol params:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.services = protocol;
        self.params = params;
        self.title = params[TITLE_PARAMS];
    }
    return self;
}

@end
