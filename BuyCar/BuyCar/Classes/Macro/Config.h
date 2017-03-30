//
//  Config.h
//  BuyCar
//
//  Created by Meng Fan on 17/3/30.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#ifndef Config_h
#define Config_h


//宽高

#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width
#define ZOOM_SCALL kWidth/375.0


#define TITLE_PARAMS @"title"



///SVP
#define SHOW_SVP(title) \
[SVProgressHUD showWithStatus:title];

#define SHOW_ERROE(title) \
[SVProgressHUD showErrorWithStatus:title];

#define SHOW_SUCCESS(title) \
[SVProgressHUD showSuccessWithStatus:title];

#define DISMISS_SVP(time) \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[SVProgressHUD dismiss]; \
});



#endif /* Config_h */
