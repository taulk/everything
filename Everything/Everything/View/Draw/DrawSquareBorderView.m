//
//  DrawSquareBorderView.m
//  Everything
//
//  Created by Kai Li on 11/5/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawSquareBorderView.h"

@implementation DrawSquareBorderView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
    CGContextSetLineWidth(context, 2.0);
    CGContextAddRect(context, CGRectMake(20, 20, 150, 200));
    CGContextStrokePath(context);
}

@end
