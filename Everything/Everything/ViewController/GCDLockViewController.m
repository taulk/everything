//
//  GCDLockViewController.m
//  Everything
//
//  Created by Kai Li on 10/16/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "GCDLockViewController.h"

@interface GCDLockViewController ()

@end

@implementation GCDLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#warning http://www.brighttj.com/ios/ios-gcd-deadlock.html
    [self case5];
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

- (void)case1
{
    NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}

- (void)case2
{
    NSLog(@"1");
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}

- (void)case3
{
    dispatch_queue_t queue = dispatch_queue_create("tau.github.everything", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
        dispatch_sync(queue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
}

- (void)case4
{
    NSLog(@"1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"2");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
}

- (void)case5
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2");
        });
        NSLog(@"3");
    });
    NSLog(@"4");
    while (1) {

    }
    NSLog(@"5");
}

- (void)case6
{
#pragma http://stackoverflow.com/questions/11909629/waiting-until-two-async-blocks-are-executed-before-starting-another-block
    dispatch_group_t group = dispatch_group_create();

    dispatch_group_async(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        // block1
        NSLog(@"Block1");
        [NSThread sleepForTimeInterval:5.0];
        NSLog(@"Block1 End");
    });


    dispatch_group_async(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        // block2
        NSLog(@"Block2");
        [NSThread sleepForTimeInterval:8.0];
        NSLog(@"Block2 End");
    });

    dispatch_group_notify(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        // block3
        NSLog(@"Block3");
    });
}

- (void)case7
{
    // create a group
    dispatch_group_t group = dispatch_group_create();

    // pair a dispatch_group_enter for each dispatch_group_leave
    dispatch_group_enter(group);     // pair 1 enter
    [self doSomethingInBackground:1 completion:^{
        NSLog(@"1 done");
        dispatch_group_leave(group); // pair 1 leave
    }];

    // again... (and again...)
    dispatch_group_enter(group);     // pair 2 enter
    [self doSomethingInBackground:2 completion:^{
        NSLog(@"2 done");
        dispatch_group_leave(group); // pair 2 leave
    }];

    // Next, setup the code to execute after all the paired enter/leave calls.
    //
    // Option 1: Get a notification on a block that will be scheduled on the specified queue:
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"finally!");
    });

    // Option 2: Block an wait for the calls to complete in code already running
    // (as cbartel points out, be careful with running this on the main/UI queue!):
    //
    // dispatch_group_wait(group, DISPATCH_TIME_FOREVER); // blocks current thread
    // NSLog(@"finally!");
}

#pragma mark - Private

- (void)doSomethingInBackground:(NSInteger)value completion:(void (^)())completion
{

}

@end
