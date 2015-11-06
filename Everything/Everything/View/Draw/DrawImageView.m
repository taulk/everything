//
//  DrawImageView.m
//  Everything
//
//  Created by Kai Li on 11/5/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawImageView.h"

@implementation DrawImageView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    NSString* imagePath = [[NSBundle mainBundle] pathForResource:@"everything" ofType:@"png"];
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:imagePath];

    [image drawAtPoint:CGPointMake(0, 0.)];

    CGImageRef imageRef = image.CGImage;
    CGContextSaveGState(context);

    // upside-down.
    CGRect touchRect = CGRectMake(0, image.size.height+20.f, image.size.width, image.size.height);
    CGContextDrawImage(context, touchRect, imageRef);


    // upside-down.
    CGAffineTransform myAffine = CGAffineTransformMakeRotation(M_PI);
    myAffine = CGAffineTransformTranslate(myAffine, -image.size.width, -image.size.height);
    CGContextConcatCTM(context, myAffine);

    CGContextRotateCTM(context, M_PI);
    CGContextTranslateCTM(context, -image.size.width, -image.size.height);

    CGRect touchRect1 = CGRectMake(0, image.size.height*2 + 40.f, image.size.width, image.size.height);
    CGContextDrawImage(context, touchRect1, imageRef);

    // mirror.
    CGContextRotateCTM(context, M_PI);
    CGContextTranslateCTM(context, -image.size.width, -image.size.height);

    CGRect touchRect2 = CGRectMake(0, -image.size.height*3 - 60.f, image.size.width, image.size.height);
    CGContextDrawImage(context, touchRect2, imageRef);


    CGContextRestoreGState(context);
}

@end
