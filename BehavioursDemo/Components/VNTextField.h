//
//  VNTextField.h
//  KeyboardTests
//
//  Created by Vitor Navarro on 6/23/14.
//  Copyright (c) 2014 Vitor Navarro. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VNTextFieldDelegate;

@interface VNTextField : UIView <UITextFieldDelegate>

@property (weak, nonatomic) id<VNTextFieldDelegate> delegate;

@end

@protocol VNTextFieldDelegate <NSObject>

-(void)textField:(VNTextField *)sender returnedText:(NSString *)text;

@end