//
//  DrawSquareNoBorderView.m
//  Everything
//
//  Created by Kai Li on 11/5/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawSquareNoBorderView.h"

@implementation DrawSquareNoBorderView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetRGBFillColor(context, 0, 0.25, 0, 0.5);
    CGContextFillRect(context, CGRectMake(20, 20, 150, 200));
    CGContextStrokePath(context);
}

@end
