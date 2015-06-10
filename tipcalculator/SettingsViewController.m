//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Taco Chang on 2015/6/10.
//  Copyright (c) 2015年 Taco Chang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (void)saveSettings;
- (void)loadSettings;
- (IBAction)onChange:(id)sender;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSettings];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipControl.selectedSegmentIndex forKey:@"defaultTipAmount"];
    [defaults synchronize];
}

- (void) loadSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger intValue = [defaults integerForKey:@"defaultTipAmount"];
    self.tipControl.selectedSegmentIndex = intValue;
}

- (IBAction)onChange:(id)sender {
    [self saveSettings];
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
