//
//  DrawTableViewCell.h
//  Everything
//
//  Created by Kai Li on 11/4/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawLineView.h"
#import "DrawTextView.h"
#import "DrawSquareBorderView.h"
#import "DrawSquareNoBorderView.h"
#import "DrawSquareBackgroundView.h"
#import "DrawEllipseView.h"
#import "DrawArcView.h"
#import "DrawGradientView.h"
#import "DrawCurveView.h"
#import "DrawImageView.h"

typedef enum {
    DrawViewTypeLine,
    DrawViewTypeText,
    DrawViewTypeSquareBorder,
    DrawViewTypeSquareNoBorder,
    DrawViewTypeSquareBackground,
    DrawViewTypeEllipse,
    DrawViewTypeArc,
    DrawViewTypeGradient,
    DrawViewTypeCurve,
    DrawViewTypeImage,
} DrawViewType;

@interface DrawTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *drawView;

@end

extern NSString *DrawTableViewCellIdentifer;