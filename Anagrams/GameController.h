//
//  GameController.h
//  Anagrams
//
//  Created by Chao Xu on 15/6/30.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "TileView.h"

@interface GameController : NSObject<TileDraDelegateProtocol>
@property (weak, nonatomic)UIView *gameView;
@property (strong , nonatomic) Level *level;

- (void)dealRandomAnagram;
@end
