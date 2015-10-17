//
//  SpeakViewController.m
//  Everything
//
//  Created by Kai Li on 10/16/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "SpeakViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SpeakViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation SpeakViewController

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
- (void)speakWithWords:(NSString *)words {
    AVSpeechUtterance *speechUtterance = [[AVSpeechUtterance alloc] initWithString:words];
    speechUtterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:speechUtterance];
}

- (IBAction)speak:(id)sender {
    [self.view endEditing:YES];

    NSString *words = self.textField.text;

    [self speakWithWords:words];
}

/*
 *
 * Override this method to dismiss the keyboard wherever else than the textfield is pressed.
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.textField resignFirstResponder];
}

@end
