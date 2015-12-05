//
//  DetectVolumeViewController.m
//  Everything
//
//  Created by Kai Li on 11/30/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DetectVolumeViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface DetectVolumeViewController ()

@property (nonatomic, strong) UILabel *volumeValueLabel;

@end

@implementation DetectVolumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    MPVolumeView *volume = [[MPVolumeView alloc] initWithFrame:CGRectMake(10.0, 100.0, 284.0, 23.0)];
    [self.view addSubview:volume];

    self.volumeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.f, 150.f, 100.f, 30.f)];
    [self.view addSubview:self.volumeValueLabel];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(volumeChanged:)
                                                 name:@"AVSystemController_SystemVolumeDidChangeNotification"
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)volumeChanged:(NSNotification *)notification
{
    float volumeLevel = [notification.userInfo[@"AVSystemController_AudioVolumeNotificationParameter"] floatValue];

    self.volumeValueLabel.text = [NSString stringWithFormat:@"%@", @(volumeLevel)];
    NSLog(@"volumeChanged:(%f)", volumeLevel);
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
