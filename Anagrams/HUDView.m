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
    hud.userInteractionEnabled = YES;
    
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
    
    //load the button image
    UIImage *image = [UIImage imageNamed:@"btn"];
    //the help button
    hud.btnHelp = [UIButton buttonWithType:UIButtonTypeCustom];
    [hud.btnHelp setTitle:@"Hint" forState:UIControlStateNormal];
    hud.btnHelp.titleLabel.font = kFontHUD;
    [hud.btnHelp setBackgroundImage:image forState:UIControlStateNormal];
    hud.btnHelp.frame = CGRectMake(20, 30, image.size.width, image.size.height);
    hud.btnHelp.alpha = 0.8;
    [hud addSubview:hud.btnHelp];
    return hud;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //1 let touches through and only catch the ones on buttons
    UIView* hitView = (UIView*)[super hitTest:point withEvent:event];
    
    //2 Then you check whether this view is a button (!), and if it is, then you forward the touch to that button.

    if ([hitView isKindOfClass:[UIButton class]]) {
        return hitView;
    }
    
    //3 If it’s not a button, you return nil, effectively forwarding the touch to the underlaying game elements layer
    return nil;}
@end































