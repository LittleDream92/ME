//
//  BaseNavigationController.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = (id)self;
    
    [self resetNavi];
}

/** 导航栏 */
- (void)resetNavi {
    UIImage *image = [UIImage imageNamed:@"navBar"];
    
    //更改图片大小
    UIGraphicsBeginImageContext(CGSizeMake(kWidth, 64));
    [image drawInRect:CGRectMake(0, 0, kWidth, 64)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //设置导航栏背景图片
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //修改导航栏标题的颜色和字体大小
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:18]};
    
}

#pragma mark - UINavigationControllerDelegate

//push页面时隐藏tabbar栏
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - action
// 表示的意思是:当前控制器是根控制器了,那么就不接收触摸事件,只有当不是根控制器时才需要接收事件.
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.childViewControllers.count > 1;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
