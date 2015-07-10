//
//  HUDView.h
//  Anagrams
//
//  Created by Chao Xu on 15/7/3.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StopwatchView.h"
#import "CounterLabelView.h"

@interface HUDView : UIView
@property (strong, nonatomic) StopwatchView *stopwatch;
@property (strong, nonatomic) CounterLabelView *gamePoints;
@property (strong, nonatomic) UIButton *btnHelp;
+(instancetype)viewWithRect:(CGRect)r;
@end
