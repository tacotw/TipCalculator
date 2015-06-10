//
//  TipViewController.m
//  tipcalculator
//
//  Created by Taco Chang on 2015/6/10.
//  Copyright (c) 2015年 Taco Chang. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

- (IBAction)onTap:(id)sender;
- (IBAction)onChange:(id)sender;
- (void)updateValues;
- (void)saveSettings;
- (void)loadSettings;
- (IBAction)billChange:(id)sender;


@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSettings];
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

- (void)viewWillAppear:(BOOL)animated
{
    [self.billTextField becomeFirstResponder];
    [self loadSettings];
    [self updateValues];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$ %0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$ %0.2f", totalAmount];
}

- (void) saveSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipControl.selectedSegmentIndex forKey:@"defaultTipAmount"];
    [defaults synchronize];
}

- (IBAction)onChange:(id)sender {
    [self saveSettings];
    [self updateValues];
}

- (void) loadSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger intValue = [defaults integerForKey:@"defaultTipAmount"];
    self.tipControl.selectedSegmentIndex = intValue;
}

- (IBAction)billChange:(id)sender {
    [self updateValues];
}
@end
