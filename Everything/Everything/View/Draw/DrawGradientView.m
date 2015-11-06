//
//  DrawGradientView.m
//  Everything
//
//  Created by Kai Li on 11/5/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawGradientView.h"

@implementation DrawGradientView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextClip(context);
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] = {
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
    };

    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(context, gradient,CGPointMake(50.f, 100.f) ,CGPointMake(50.f, 200.f), kCGGradientDrawsBeforeStartLocation);
}

@end
