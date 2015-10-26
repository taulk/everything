//
//  ViewController.m
//  Everything
//
//  Created by Kai Li on 10/9/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "ViewController.h"
#import "FeatureMeta.h"

static NSString *ViewControllerTableViewCellIdentifier = @"ViewControllerTableViewCellIdentifier";
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ViewControllerTableViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = [self composeDataList];
    }
    return _dataList;
}

- (NSArray *)composeDataList
{
    FeatureMeta *screenShotNotification = [[FeatureMeta alloc] init];
    screenShotNotification.title = @"Screen Shot Notification";
    screenShotNotification.controllerSBID = @"ScreenShotSBID";

    FeatureMeta *imageWithColorView = [[FeatureMeta alloc] init];
    imageWithColorView.title = @"UIImage(Color)";
    imageWithColorView.controllerSBID = @"ImageWithColorSBID";

    FeatureMeta *speak = [[FeatureMeta alloc] init];
    speak.title = @"Speak(AVSpeechSynthesizer)";
    speak.controllerSBID = @"SpeakSBID";

    FeatureMeta *gcdLock = [[FeatureMeta alloc] init];
    gcdLock.title = @"GCD dead Lock";
    gcdLock.controllerSBID = @"GCDLockSBID";

    FeatureMeta *enableCopyLabel = [[FeatureMeta alloc] init];
    enableCopyLabel.title = @"UICopyLabel";
    enableCopyLabel.controllerSBID = @"UICopyLabelSBID";

    FeatureMeta *tableWithCopyCell = [[FeatureMeta alloc] init];
    tableWithCopyCell.title = @"TableWithCopyCell";
    tableWithCopyCell.controllerSBID = @"TableWithCopyCellSBID";

    FeatureMeta *shake = [[FeatureMeta alloc] init];
    shake.title = @"Shake";
    shake.controllerSBID = @"ShakeSBID";

    FeatureMeta *location = [[FeatureMeta alloc] init];
    location.title = @"Location";
    location.controllerSBID = @"LocationSBID";

    return @[@[screenShotNotification, shake], @[imageWithColorView, enableCopyLabel, tableWithCopyCell], @[speak, location], @[gcdLock]];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)self.dataList[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ViewControllerTableViewCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = ((FeatureMeta *)self.dataList[indexPath.section][indexPath.row]).title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSString *controllerSBID = ((FeatureMeta *)self.dataList[indexPath.section][indexPath.row]).controllerSBID;
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:controllerSBID];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
