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
#import "HUDView.h"
#import "GameData.h"
#import "AudioController.h"

typedef void (^CallbackBlock)() ;

@interface GameController : NSObject<TileDraDelegateProtocol>
@property (weak, nonatomic)UIView *gameView;
@property (strong , nonatomic) Level *level;
@property (weak, nonatomic) HUDView *hud;
@property (strong, nonatomic) GameData *data;
@property (strong, nonatomic) AudioController *audioController;
@property (strong, nonatomic) CallbackBlock onAnagramSolved;

- (void)dealRandomAnagram;
@end
