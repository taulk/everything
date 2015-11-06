//
//  DrawTextView.m
//  Everything
//
//  Created by Kai Li on 11/4/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawTextView.h"

@implementation DrawTextView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBFillColor (context, 0.5, 0.5, 0.5, 0.5);
    UIFont  *font = [UIFont boldSystemFontOfSize:18.0];
    [@"Hello world\nLine 2" drawInRect:CGRectMake(20, 20, 280, 300) withAttributes:@{@"font": font}];
}

@end
