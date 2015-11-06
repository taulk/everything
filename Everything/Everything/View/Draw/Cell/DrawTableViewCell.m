//
//  DrawTableViewCell.m
//  Everything
//
//  Created by Kai Li on 11/4/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawTableViewCell.h"

NSString *DrawTableViewCellIdentifer = @"DrawTableViewCellIdentifer";

@implementation DrawTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDrawView:(UIView *)drawView
{
    if (_drawView) {
        [_drawView removeFromSuperview];
    }
    _drawView = drawView;
    [self.contentView addSubview:_drawView];
}

@end
