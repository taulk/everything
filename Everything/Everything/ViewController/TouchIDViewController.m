//
//  TouchIDViewController.m
//  Everything
//
//  Created by Kai Li on 11/10/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "TouchIDViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

#define kDefaultPassword                @"helloworld"

@interface TouchIDViewController ()

@property (weak, nonatomic) IBOutlet UIButton *authButton;

@property (nonatomic, strong) NSString *passwordEntered;

@end

@implementation TouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)showResult:(BOOL)success
{
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:success ? @"YES!" : @"NO" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Do nothing.
    }];
    [alertViewController addAction:action];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertViewController animated:YES completion:nil];
    });
}

- (void)showSuccess
{
    [self showResult:YES];
}

- (void)showFail
{
    [self showResult:NO];
}

- (void)validatePassword:(void (^)(BOOL success))block
{
    __weak typeof(self) sself = self;

    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Input password" message:nil preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [sself.view endEditing:YES];
        if (block) {
            NSLog(@"passwordEntered: '%@'", sself.passwordEntered);
            block([sself.passwordEntered isEqualToString:kDefaultPassword]);
        }
    }];
    [controller addAction:action];

    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.secureTextEntry = YES;
        [textField addTarget:self action:@selector(textFieldTextDidChange:) forControlEvents:UIControlEventEditingChanged];
    }];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:controller animated:YES completion:nil];
    });

}

- (IBAction)authButtonAction:(id)sender {
    LAContext *context = [[LAContext alloc] init];
    NSError *authError = nil;

    NSString *reason = @"Give it a try!";

    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:reason reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                [self showSuccess];
            } else {
                switch (error.code) {
                    case LAErrorUserCancel:
                        [self showFail];
                        break;
                    case LAErrorUserFallback: {
                        [self validatePassword:^(BOOL success) {
                            [self showResult:success];
                        }];
                    }
                        break;
                    default:
                        [self showFail];
                        break;
                }
            }
        }];
    } else {
        [self validatePassword:^(BOOL success) {
            [self showResult:success];
        }];
    }
}

#pragma mark -

- (void)textFieldTextDidChange:(UITextField *)textField
{
    self.passwordEntered = textField.text;
    NSLog(@"End editing.. %@", self.passwordEntered);
}

@end
