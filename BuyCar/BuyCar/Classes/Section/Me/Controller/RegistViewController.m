//
//  RegistViewController.m
//  BuyCar
//
//  Created by Meng Fan on 17/3/31.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistViewModel.h"

@interface RegistViewController ()

//ViewModel
@property (nonatomic, strong) RegistViewModel *viewModel;

@end

@implementation RegistViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    [self setupViews];
}


#pragma mark - UI
- (void)setupViews {
    
}


#pragma mark - action
-(void)bindViewModel {
    [super bindViewModel];
    
    
}


#pragma mark - lazyLoading


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
