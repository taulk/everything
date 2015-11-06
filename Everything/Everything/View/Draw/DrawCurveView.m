//
//  DrawCurveView.m
//  Everything
//
//  Created by Kai Li on 11/5/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawCurveView.h"

@implementation DrawCurveView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddCurveToPoint(context, 0, 50, 100, 200, 200, 50);
    CGContextStrokePath(context);


    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextMoveToPoint(context, 10, 200);
    CGContextAddQuadCurveToPoint(context, 150, 50, 250, 250);
    CGContextStrokePath(context);
}

@end
