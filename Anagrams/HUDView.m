//
//  HUDView.m
//  Anagrams
//
//  Created by Chao Xu on 15/7/3.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import "HUDView.h"
#import "config.h"
@implementation HUDView
+(instancetype)viewWithRect:(CGRect)r{
    
    //create the hud layer
    HUDView* hud = [[HUDView alloc] initWithFrame:r];
    hud.userInteractionEnabled = NO;
    
    //the stopwatch
    hud.stopwatch = [[StopwatchView alloc] initWithFrame: CGRectMake(kScreenWidth/2-150, 0, 300, 100)];
    hud.stopwatch.seconds = 0;
    [hud addSubview: hud.stopwatch];
    
    //points label
    UILabel *pts = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-120, 30, 140, 70)];
    pts.backgroundColor = [UIColor clearColor];
    pts.font = kFontHUD;
    pts.text = @"Points :";
    [hud addSubview:pts];
    
    //the dynamic points label
    hud.gamePoints = [CounterLabelView labelWithFont:kFontHUD frame:CGRectMake(kScreenWidth,30,200,70) andValue:0];
    hud.gamePoints.textColor = [UIColor colorWithRed:0.38 green:0.098 blue:0.035 alpha:1] /*#611909*/;
    [hud addSubview: hud.gamePoints];
    
    return hud;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
