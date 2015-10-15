//
//  UIImage+Color.h
//  Everything
//
//  Created by Kai Li on 10/14/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
