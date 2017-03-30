//
//  RootTabbarController.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "RootTabbarController.h"
#import "BaseNavigationController.h"
#import "DKHomeVC.h"
#import "DKActivityVC.h"
#import "DKMeVC.h"

@interface RootTabbarController ()

@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVCs];
}


#pragma mark - setupChildVCs
-(void)setupChildVCs {
    DKHomeVC *homeVC = [[DKHomeVC alloc] initWithViewModel:[[DKHomeVM alloc] initWithProtocol:nil params:@{TITLE_PARAMS:@"首页"}]];
    BaseNavigationController *nav1 = [self setChildNavsWithVC:homeVC title:@"首页" imageName:@"HomeNormal" selectedImageName:@"HomeHight"];
    
    DKActivityVC *activityVC = [[DKActivityVC alloc] initWithViewModel:[[DKActivityVM alloc] initWithProtocol:nil params:@{TITLE_PARAMS:@"活动"}]];
    BaseNavigationController *nav2 = [self setChildNavsWithVC:activityVC title:@"活动" imageName:@"ActivityNormal" selectedImageName:@"ActivityHight"];
    
    DKMeVC *meVC = [[DKMeVC alloc] initWithViewModel:[[DKMeVM alloc] initWithProtocol:nil params:@{TITLE_PARAMS:@"我的"}]];
    BaseNavigationController *nav3 = [self setChildNavsWithVC:meVC title:@"我的" imageName:@"MeNormal" selectedImageName:@"MeHight"];
    
    NSArray *vcs = @[nav1, nav2, nav3];
    self.viewControllers = vcs;
}


- (BaseNavigationController *)setChildNavsWithVC:(DKBaseViewController *)vc title:(NSString *)title imageName:(NSString *)imgName selectedImageName:(NSString *)selectImgName {
    //文字和图片
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImgName];
    
    //去掉系统自带的蓝色
    self.tabBar.tintColor = THEME_COLOR;
    
    //设置tabbar上的字体
    NSDictionary *dic = @{NSForegroundColorAttributeName:BLACK_COLOR, NSFontAttributeName:[UIFont systemFontOfSize:12]};
    NSDictionary *selectDic = @{NSForegroundColorAttributeName:THEME_COLOR, NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [self.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateHighlighted];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}




#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
