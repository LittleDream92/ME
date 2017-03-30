//
//  MapManager.h
//  BuyCar
//
//  Created by Meng Fan on 17/3/30.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MapManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic,strong)CLLocationManager *manager;

@property (nonatomic,copy)NSString *cityName;


+ (MapManager *)sharedMapManager;

+ (BOOL)dk_isLocationServiceOpen;

- (void)dk_getGps;
- (void)dk_stop;

@end
