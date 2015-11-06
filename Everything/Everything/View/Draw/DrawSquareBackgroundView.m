//
//  DrawSquareBackgroundView.m
//  Everything
//
//  Created by Kai Li on 11/5/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawSquareBackgroundView.h"

@implementation DrawSquareBackgroundView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(context, 0.0f, 250);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    UIGraphicsPushContext(context);
    CGContextSetLineWidth(context,30);
    CGContextSetRGBStrokeColor(context, 250.0/255, 250.0/255, 210.0/255, 1.0);
    CGContextStrokeRect(context, CGRectMake(20, 20, 150, 200));
    UIGraphicsPopContext();
}

@end
