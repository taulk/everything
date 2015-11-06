//
//  DrawViewController.m
//  Everything
//
//  Created by Kai Li on 10/31/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawTableViewCell.h"

@interface DrawViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *drawViewTypeList;

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.drawViewTypeList = @[@(DrawViewTypeLine), @(DrawViewTypeText), @(DrawViewTypeSquareBorder), @(DrawViewTypeSquareNoBorder), @(DrawViewTypeSquareBackground), @(DrawViewTypeEllipse), @(DrawViewTypeArc), @(DrawViewTypeGradient), @(DrawViewTypeCurve), @(DrawViewTypeImage)];

    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[DrawTableViewCell class] forCellReuseIdentifier:DrawTableViewCellIdentifer];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.drawViewTypeList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size.width;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DrawTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DrawTableViewCellIdentifer forIndexPath:indexPath];
    UIView *drawView;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGRect rect = CGRectMake(20, 20, width-40, width-40);
    switch ([self.drawViewTypeList[indexPath.row] integerValue]) {
        case DrawViewTypeLine:
            drawView = [[DrawLineView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeText:
            drawView = [[DrawTextView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeSquareBorder:
            drawView = [[DrawSquareBorderView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeSquareNoBorder:
            drawView = [[DrawSquareNoBorderView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeSquareBackground:
            drawView = [[DrawSquareBackgroundView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeEllipse:
            drawView = [[DrawEllipseView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeArc:
            drawView = [[DrawArcView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeGradient:
            drawView = [[DrawGradientView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeCurve:
            drawView = [[DrawCurveView alloc] initWithFrame:rect];
            break;
        case DrawViewTypeImage:
            drawView = [[DrawImageView alloc] initWithFrame:rect];
            break;
        default:
            break;
    }
    cell.drawView = drawView;
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
