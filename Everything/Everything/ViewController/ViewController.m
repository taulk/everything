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

@end
