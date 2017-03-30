//
//  DKBaseViewController.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "DKBaseViewController.h"
#import "BaseViewModel.h"

@interface DKBaseViewController ()

@property (nonatomic, strong) BaseViewModel *viewModel;

//返回按钮
@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation DKBaseViewController

-(void)dealloc {
    NSLog(@"%@--释放了", NSStringFromClass([self class]));
}

//自定义初始化方法
- (instancetype)initWithViewModel:(BaseViewModel *)viewModle {
    self = [super init];
    if (self) {
        self.viewModel = viewModle;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.backgroundColor = [UIColor whiteColor];

    if (self.navigationController && self != self.navigationController.viewControllers.firstObject) {
        //自定义返回按钮
        [self resetBackBtn];
    }
}

#pragma mark - UI
//自定义返回按钮
- (void)resetBackBtn {

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
    
}

#pragma mark - action
//绑定ViewModel
- (void)bindViewModel {
    RAC(self.navigationItem, title) = RACObserve(self.viewModel, title);
}

//返回按钮
- (void)backAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - LazyLoading
-(UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"left"] forState:UIControlStateHighlighted];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 0);
        _backBtn.frame = CGRectMake(0, 0, 50, 44);
        [_backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
