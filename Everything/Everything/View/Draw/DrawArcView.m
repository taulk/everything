//
//  DrawArcView.m
//  Everything
//
//  Created by Kai Li on 11/5/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawArcView.h"

@implementation DrawArcView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextBeginPath(context);
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddArcToPoint(context, 50, 200, 250, 200, 150);
    CGContextStrokePath(context);

    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddArcToPoint(context, 100,200, 300,200, 100);
    CGContextStrokePath(context);

}

@end
