//
//  CaptureScrollViewViewController.m
//  Everything
//
//  Created by Kai Li on 10/28/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "CaptureScrollViewViewController.h"
#import "UIImage+Capture.h"

static NSString *CaptureScrollViewTableViewCellIdentifier = @"CaptureScrollViewTableViewCellIdentifier";

@interface CaptureScrollViewViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CaptureScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Capture" style:UIBarButtonItemStylePlain target:self action:@selector(captureScrollView)];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CaptureScrollViewTableViewCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)captureScrollView
{
    UIImage *image = [UIImage imageCaptureScrollView:self.tableView];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CaptureScrollViewTableViewCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Section : %@, Row : %@", @(indexPath.section), @(indexPath.row)];
    return cell;
}

@end
