
//
//  StopwatchView.m
//  Anagrams
//
//  Created by Chao Xu on 15/7/3.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import "StopwatchView.h"
#import "config.h"

@implementation StopwatchView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.font = kFontHUDBig;
    }
    return self;
}

-(void)setSeconds:(int)seconds
{
    self.text = [NSString stringWithFormat:@" %02.f : %02i", round(seconds / 60), seconds % 60 ];
}

@end
