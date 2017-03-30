//
//  ViewModelNavigationImpl.h
//  框架
//
//  Created by Meng Fan on 17/3/8.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

//这是跳转的 Object

#import <Foundation/Foundation.h>
#import "BaseViewModelProtocol.h"

@interface ViewModelNavigationImpl : NSObject <BaseViewModelProtocol>

@property (nonatomic, copy) NSString *className;

//设置当前rootVC
@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithNavigationController:(UINavigationController *)navi;

@end
