//
//  ChangePwdViewController.m
//  BuyCar
//
//  Created by Meng Fan on 17/3/31.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "ChangePwdViewController.h"
#import "ChangePwdViewModel.h"

#import "RegistAndChangePwdView.h"

@interface ChangePwdViewController ()

@property (nonatomic, strong) RegistAndChangePwdView *textfieldView;

//ViewModel
@property (nonatomic, strong) ChangePwdViewModel *viewModel;

@end

@implementation ChangePwdViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BASE_GRAY_COLOR;
    [self bindViewModel];
    [self setupViews];
}


#pragma mark - UI
- (void)setupViews {
    [self.view addSubview:self.textfieldView];
    
}


#pragma mark - action
-(void)bindViewModel {
    [super bindViewModel];
    
}


#pragma mark - lazyLoading
-(RegistAndChangePwdView *)textfieldView {
    if (!_textfieldView) {
        _textfieldView = [[RegistAndChangePwdView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) isRegist:NO];
    }
    return _textfieldView;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
