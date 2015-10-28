//
//  LocationPin.h
//  Everything
//
//  Created by Kai Li on 10/27/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LocationPin : NSObject <MKAnnotation>

- (id)initWithCoordinate2D:(CLLocationCoordinate2D)coordinate
                     title:(NSString *)title
                  subTitle:(NSString *)subTitle;

@end
