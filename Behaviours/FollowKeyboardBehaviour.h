//
//  FollowKeyboardAnimator.h
//  Pontofrio
//
//  Created by Taqtile on 6/24/14.
//  Copyright (c) 2014 Taqtile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FollowKeyboardBehaviour : NSObject

@property (weak, nonatomic) UIView *targetView;

-(void)turnOff;
@end
