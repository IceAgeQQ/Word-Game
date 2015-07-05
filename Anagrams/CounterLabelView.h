//
//  CounterLabelView.h
//  Anagrams
//
//  Created by Chao Xu on 15/7/5.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterLabelView : UILabel
@property (assign, nonatomic) int value;

+(instancetype)labelWithFont:(UIFont *)font frame:(CGRect)r andValue:(int)v;
-(void)countTo:(int)to withDuration:(float)t;
@end
