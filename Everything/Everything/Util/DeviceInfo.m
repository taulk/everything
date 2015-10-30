//
//  DeviceInfo.m
//  Everything
//
//  Created by Kai Li on 10/29/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DeviceInfo.h"

@implementation DeviceInfo

+ (void)deviceInfo
{
    NSLog(@"HostName: %@", [[NSProcessInfo processInfo] hostName]);
    //globallyUniqueString 唯一的标示符，每次调用都会不一样，可以用作一些临时缓存文件的名字
    NSLog(@"GlobalUniqueString: %@", [[NSProcessInfo processInfo] globallyUniqueString]);
//    //操作系统名称
//    NSLog(@"OperatingSystemName: %@", [[NSProcessInfo processInfo] operatingSystemName]);
    //操作系统版本
    NSLog(@"OperatingSystemVersion: %@", [[NSProcessInfo processInfo] operatingSystemVersionString]);
    //物理内存
    NSLog(@"PhysicalMem: %llu", [[NSProcessInfo processInfo] physicalMemory]);
    //进程名称
    NSLog(@"ProcessName: %@", [[NSProcessInfo processInfo] processName]);

    //供应商标识
    NSLog(@"UniqueId: %@", [UIDevice currentDevice].identifierForVendor);
    //设备类型（iPhone、iPad）
    NSLog(@"userInterfaceIdiom: %ld", (long)[UIDevice currentDevice].userInterfaceIdiom);
    //设备名字
    NSLog(@"Name: %@", [UIDevice currentDevice].name);
    //系统名字
    NSLog(@"SystemName: %@", [UIDevice currentDevice].systemName);
    //系统版本
    NSLog(@"SystemVersion: %@", [UIDevice currentDevice].systemVersion);
    //模型
    NSLog(@"Model: %@", [UIDevice currentDevice].model);
    //本地化的模型
    NSLog(@"LocalizeModel: %@", [UIDevice currentDevice].localizedModel);
    //电池状态
    NSLog(@"BatteryLevel: %f", [UIDevice currentDevice].batteryLevel);
}

@end
