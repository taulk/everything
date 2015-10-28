//
//  LocationPin.m
//  Everything
//
//  Created by Kai Li on 10/27/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "LocationPin.h"

@implementation LocationPin

@synthesize coordinate = _coordinate, title = _title, subtitle = _subtitle;

- (id)initWithCoordinate2D:(CLLocationCoordinate2D)coordinate title:(NSString *)title subTitle:(NSString *)subTitle
{
    if (self = [super init]) {
        _title = title;
        _subtitle = subTitle;
        _coordinate = coordinate;
    }
    return self;
}

@end
