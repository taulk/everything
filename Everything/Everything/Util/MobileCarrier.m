//
//  MobileCarrier.m
//  Everything
//
//  Created by Kai Li on 10/30/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "MobileCarrier.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation MobileCarrier

+ (NSString *)carrierName
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = info.subscriberCellularProvider;
    return carrier.carrierName;
}

@end
