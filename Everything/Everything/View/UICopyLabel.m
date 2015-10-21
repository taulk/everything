//
//  UICopyLabel.m
//  Everything
//
//  Created by Kai Li on 10/21/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "UICopyLabel.h"

#pragma http://nshipster.com/uimenucontroller/

/*
 * UILabel must be subclassed to implement canBecomeFirstResponder & canPerformAction:withSender:
 * Each performable action must implement a corresponding method that interacts with UIPasteboard
 * When instantiated by a controller, the label must have userInteractionEnabled set to YES (it is not recommended that this be hard-coded into the subclass implementation)
 * A UIGestureRecognizer must be added to the label (else, UIResponder methods like touchesBegan:withEvent: are implemented manually in the subclass)
 * In the method implementation corresponding to the gesture recognizer action, UIMenuController must be positioned and made visible
 * Finally, the label must become first responder
 */

// Important : Use subclass NOT category. At least, not override initWithFrame:.

@implementation UICopyLabel

#pragma mark -

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self _copyLabelInit];
    }

    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self _copyLabelInit];
}

#pragma mark - Private

- (void)_copyLabelInit
{
    [self attachTapGesture];
}

- (void)attachTapGesture
{
    self.userInteractionEnabled = YES;

    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
    [self addGestureRecognizer:longPressGesture];
}

#pragma mark - UIResponderStandardEditActions

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return action == @selector(copy:);
}

- (void)copy:(id)sender
{
    [UIPasteboard generalPasteboard].string = self.text;
}

#pragma mark - UIGestureRecognizer

- (void)longPressHandler:(UIGestureRecognizer *)recognizer
{
    NSLog(@"recognizer.state : %@", @(recognizer.state));

    if (recognizer.state == UIGestureRecognizerStateBegan) {

        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setTargetRect:self.bounds inView:self];
        [menuController setMenuVisible:YES animated:YES];

        [self becomeFirstResponder];
    }
}

@end
