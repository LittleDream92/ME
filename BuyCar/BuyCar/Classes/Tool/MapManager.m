//
//  MapManager.m
//  BuyCar
//
//  Created by Meng Fan on 17/3/30.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "MapManager.h"

@interface MapManager ()

@property(nonatomic, strong)CLGeocoder *geocoder;

@end


@implementation MapManager



+ (BOOL)dk_isLocationServiceOpen
{
    if ([ CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        return NO;
    } else
        return YES;
}

-(CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

+ (MapManager *)sharedMapManager
{
    static MapManager *instance = nil;
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        
        instance = [[MapManager alloc] init];
    });
    
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        // 打开定位 然后得到数据
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        //_manager.desiredAccuracy = kCLLocationAccuracyBest;
        _manager.desiredAccuracy = kCLLocationAccuracyKilometer;
        _manager.distanceFilter = 1000;
        
        if ([_manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [_manager requestWhenInUseAuthorization];
            //[_manager requestAlwaysAuthorization];
        }
        
    }
    return self;
}

- (void)dk_getGps
{
    // 停止上一次的
//    [_manager stopUpdatingLocation];
    // 开始新的数据定位
    [_manager startUpdatingLocation];
}


- (void)dk_stop {
    
    [_manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject];
    // NSLog(@"%zd",location.coordinate);
    
    // 反向地理编译出地址信息
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (!error)
        {
            if ([placemarks count] > 0) {
                
                CLPlacemark *placemark = [placemarks firstObject];
                // NSLog(@"placemark-----%@",placemark);
                NSLog(@"placemark.city-----%@",placemark.locality);
                
                // 获取城市
                NSString *city = placemark.locality;
                if (!city.length) {
                    // 6
                    [MapManager sharedMapManager].cityName = CURRENT_CITY;
                }
                
                else {
                    [MapManager sharedMapManager].cityName = city;
                }
                
                
                //  NSLog(@"self.cityName---%@",[GpsManager sharedGpsManager].cityName);
                
            } else if ([placemarks count] == 0) {
                
                
                [MapManager sharedMapManager].cityName = CURRENT_CITY;
            }
        }
        else
        {
            [MapManager sharedMapManager].cityName = CURRENT_CITY;
        }
        
        //        [[CKGpsManager sharedGpsManager] stop];
        //1.这种是在需要的时候用，和下面NSUserDefaults 看自己的需求来用.
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GPS" object:nil userInfo:@{@"cityName":[MapManager sharedMapManager].cityName}];
        
        NSString *tmpCity = [MapManager sharedMapManager].cityName;
        tmpCity = [tmpCity stringByReplacingOccurrencesOfString:@"市" withString:@""];
        
        //保存当前位置信息
        if (!tmpCity.length) {
            tmpCity = CURRENT_CITY;
        }
        
        //目前只开通了长沙，南昌
        if ([tmpCity isEqualToString:@"长沙"] || [tmpCity isEqualToString:@"南昌"]) {
            
        } else {
            NSLog(@"该城市暂时未开通");
            NSString *hudStr = [NSString stringWithFormat:@"%@暂未开通，默认长沙",tmpCity];
            SHOW_ERROE(hudStr);
            DISMISS_SVP(2);
            
            tmpCity = CURRENT_CITY;
        }
        
        
        //2.这种是在首页或者启动的时候用.
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:tmpCity forKey:@"CurrentCityKey"];
        [defaults synchronize];
    }];
    
    [self.manager stopUpdatingLocation];
    
}



@end
