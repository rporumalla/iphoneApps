//
//  ViewController.m
//  tips
//
//  Created by Raj Poru on 9/18/14.
//  Copyright (c) 2014 Raj Poru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tipLabel.text = @"$0.00";
    self.totalLabel.text = @"$0.00";
    
    // set a tap gesture recognizer to dismiss the keyboard
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
   [self.view addGestureRecognizer:tapRecognizer];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (IBAction)onAmtChanged:(id)sender {
    double tipPercentages[3] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipControl.selectedSegmentIndex];
    printf("tippct = %f", tipPercentage);
    
    double amount = self.billField.text.doubleValue;
    double tip = amount * tipPercentage;
    double total = amount + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", total];
}


@end
