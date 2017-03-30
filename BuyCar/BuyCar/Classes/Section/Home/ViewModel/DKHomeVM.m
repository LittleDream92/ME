//
//  DKHomeVM.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "DKHomeVM.h"

@implementation DKHomeVM

-(instancetype)initWithProtocol:(id<BaseViewModelProtocol>)protocol params:(NSDictionary *)params {
    self = [super initWithProtocol:protocol params:params];
    
    if (self) {
        [self initViewModel];
    }
    return self;
}


- (void)initViewModel {
    
}

@end
