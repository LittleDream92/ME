//
//  DKHomeVC.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "DKHomeVC.h"

@interface DKHomeVC ()

//viewModel
@property (nonatomic, strong) DKHomeVM *viewModel;

@end


@implementation DKHomeVC
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.这种直接加入直接在首页的时候就已经获取定位拿到当前城市，在你要用的地方直接取.
    NSLog(@"gps----%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"CurrentCityKey"]);
    self.view.backgroundColor = [UIColor cyanColor];
    
    //2.有一种情况是某些APP当你用到的定位的时候才回去提示用户，获取当前城市，可以用下面这种.
    //    [[MapManager sharedMapManager] dk_getGps];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getGpsMsg:) name:@"GPS" object:nil];
}

- (void)getGpsMsg:(NSNotification *)noti
{
    NSLog(@"%@",noti.userInfo[@"cityName"]);
}

#pragma mark - UI



#pragma mark - action

#pragma mark - lazyLoading



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
