//
//  UIImage+Capture.m
//  Everything
//
//  Created by Kai Li on 10/28/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "UIImage+Capture.h"

@implementation UIImage (Capture)

+ (UIImage *)imageCaptureScrollView:(UIScrollView *)scrollView
{
    UIImage *image;
    UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, NO, [UIScreen mainScreen].scale);

    CGPoint savedContentOffset = scrollView.contentOffset;
    CGRect savedFrame = scrollView.frame;
    scrollView.contentOffset = CGPointZero;
    scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);

    [scrollView.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();

    scrollView.contentOffset = savedContentOffset;
    scrollView.frame = savedFrame;

    UIGraphicsEndImageContext();

    return image?:nil;
}

@end
