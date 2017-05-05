//
//  FollowKeyboardAnimator.m
//
//  Created by Vitor Navarro on 6/24/14.
//  The MIT License (MIT)
//  Copyright (c) 2013 by Vitor Navarro
//

#import "FollowKeyboardBehaviour.h"

@interface FollowKeyboardBehaviour()
@end


@implementation FollowKeyboardBehaviour

-(id)init{
    self = [super init];
    if(self){
        [self setup];
    }
    return self;
}

-(void)setup{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)turnOff{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)setTargetViewToSuperviewBottom{
    CGRect frame = self.targetView.frame;
    frame.origin.y = self.targetView.superview.frame.size.height - frame.size.height;
    [self.targetView setFrame:frame];
}

#pragma mark - Keyboard Notification

-(void)keyboardWillShow:(NSNotification *)notification{
    [self setTargetViewToSuperviewBottom];
    
    [self animateWithKeyboardInfo:notification.userInfo];
}

-(void)keyboardWillHide:(NSNotification *)notification{
    [self animateWithKeyboardInfo:notification.userInfo];
}

#pragma mark - Keyboard Animations

/*
 * Apple uses a undocumented animation curve which is read only by old animation style or shifting by 16 bits the 
 * animation curve. Since is safer to use old style with undocumented animation curve option we keep it that way.
 */
- (void)animateWithKeyboardInfo:(NSDictionary *)keyboardInfo
{
    NSInteger animationCurve = [keyboardInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    CGFloat duration = [keyboardInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect keyboardEndFrame = [keyboardInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    CGRect frame = self.targetView.frame;
    if(keyboardEndFrame.origin.y >= [UIScreen mainScreen].bounds.size.height){
        frame.origin.y = keyboardEndFrame.origin.y + frame.size.height;
    }
    else{
        frame.origin.y = keyboardEndFrame.origin.y - frame.size.height;
    }
    [self.targetView setFrame:frame];
    [UIView commitAnimations];
}



@end
