//
//  DrawLineView.m
//  Everything
//
//  Created by Kai Li on 11/4/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawLineView.h"

@implementation DrawLineView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);
    CGContextSetLineWidth(context, 5.f);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 20,200);
    CGContextStrokePath(context);

    CGContextMoveToPoint(context, 100, 150);
    CGContextAddLineToPoint(context, 150, 200);
    CGContextAddLineToPoint(context, 100, 250);
    CGContextAddLineToPoint(context, 50, 200);
    CGContextAddLineToPoint(context, 100, 150);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillPath(context);

    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(200,200,50,20);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillRect(context, rectangle);

    UIColor *aColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0];
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
    CGContextSetFillColorWithColor(context, aColor.CGColor);
    CGContextSetLineWidth(context, 4.0);
    CGPoint aPoints[5];
    aPoints[0] =CGPointMake(60, 20);
    aPoints[1] =CGPointMake(180, 20);
    aPoints[2] =CGPointMake(180, 140);
    aPoints[3] =CGPointMake(60, 140);
    aPoints[4] =CGPointMake(60, 20);
    CGContextAddLines(context, aPoints, 5);
    CGContextDrawPath(context, kCGPathStroke);

    CGContextSetLineWidth(context, 5.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGFloat dashArray[] = {2,6,4,2};
    CGContextSetLineDash(context, 3, dashArray, 4);     //jump 3 point, 6-(3-2)= 5 points
    CGContextMoveToPoint(context, 10, 200);
    CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
    CGContextStrokePath(context);
}

@end
