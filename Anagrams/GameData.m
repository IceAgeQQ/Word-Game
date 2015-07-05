//
//  GameData.m
//  Anagrams
//
//  Created by Chao Xu on 15/7/5.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import "GameData.h"

@implementation GameData

- (void)setPoints:(int)points{
    _points = MAX(points, 0);
}

@end
