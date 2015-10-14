//
//  ScreenShotViewController.m
//  Everything
//
//  Created by Kai Li on 10/14/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "ScreenShotViewController.h"

@interface ScreenShotViewController ()

@end

@implementation ScreenShotViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveUserDidTakeScreenshotNotification:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveUserDidTakeScreenshotNotification:(NSNotification *)notification
{
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Did take screen shot!" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Do nothing.
    }];
    [alertViewController addAction:action];
    [self presentViewController:alertViewController animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
