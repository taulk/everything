//
//  DrawEllipseView.m
//  Everything
//
//  Created by Kai Li on 11/5/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawEllipseView.h"

@implementation DrawEllipseView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGRect aRect= CGRectMake(20, 20, 180, 120);
    CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
    CGContextSetLineWidth(context, 3.0);
    CGContextAddEllipseInRect(context, aRect);
    CGContextDrawPath(context, kCGPathStroke);

    CGContextFillEllipseInRect(context, CGRectMake(200, 200, 50, 50));
}

@end
