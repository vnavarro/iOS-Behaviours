//
//  MainViewController_iPhone.m
//  KeyboardTests
//
//  Created by Vitor Navarro on 6/23/14.
//  Copyright (c) 2014 Vitor Navarro. All rights reserved.
//

#import "MainViewController_iPhone.h"
#import "VNTextField.h"

@interface MainViewController_iPhone () <VNTextFieldDelegate>
@property (weak, nonatomic) IBOutlet VNTextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end

@implementation MainViewController_iPhone

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    [self.textField setDelegate:self];
    [self.textField becomeFirstResponder];
}
- (IBAction)onTapGesture:(id)sender {
    [self.textField becomeFirstResponder];
}

-(void)textField:(VNTextField *)sender returnedText:(NSString *)text{
    [self.lblTitle setText:text];
}

@end
