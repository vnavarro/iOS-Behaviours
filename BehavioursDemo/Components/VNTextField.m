//
//  VNTextField.m
//  KeyboardTests
//
//  Created by Vitor Navarro on 6/23/14.
//  Copyright (c) 2014 Vitor Navarro. All rights reserved.
//

#import "VNTextField.h"
#import "FollowKeyboardBehaviour.h"

@interface VNTextField()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) FollowKeyboardBehaviour *followAnimationBehaviour;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation VNTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [[NSBundle mainBundle] loadNibNamed:@"VNTextField" owner:self options:nil];
    [self addSubview:self.contentView];
    
    self.followAnimationBehaviour = [FollowKeyboardBehaviour new];
    [self.followAnimationBehaviour setTargetView:self];
}

-(BOOL)becomeFirstResponder{
    return [self.textField becomeFirstResponder];
}

-(BOOL)resignFirstResponder{
    return [self.textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self resignFirstResponder];
    [self endEditing:YES];
    [self.delegate textField:self returnedText:textField.text];
    return YES;
}
@end
