//
//  DKMeVM.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "DKMeVM.h"
#import "LoginViewModel.h"

@implementation DKMeVM

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
        
        LoginViewModel *viewModel = [[LoginViewModel alloc] initWithProtocol:self.services params:@{@"title":@"登录"}];
        self.naviImpl.className = @"LoginViewController";
        [self.naviImpl pushViewModel:viewModel animated:YES];
    }];
    
}

@end
