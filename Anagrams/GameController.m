//
//  GameController.m
//  Anagrams
//
//  Created by Chao Xu on 15/6/30.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import "GameController.h"
#import "config.h"
#import "TileView.h"
#import "TargetView.h"


@implementation GameController{
    NSMutableArray *_tiles;
    NSMutableArray *_targets;
}

- (void)dealRandomAnagram {
    NSAssert(self.level.anagrams, @"no level loaded");
    
    int randomIndex = arc4random()%[self.level.anagrams count];
    NSArray *anaPair = self.level.anagrams[randomIndex];
    
    NSString *anagram1 = anaPair[0];
    NSString *anagram2 = anaPair[1];
    
    int ana1len = [anagram1 length];
    int ana2len = [anagram2 length];
    
    NSLog(@"phrase1[%i]: %@", ana1len, anagram1);
    NSLog(@"phrase2[%i]: %@",ana2len, anagram2);
    
    //calculate the tile size
    float tileSide = ceilf(kScreenWidth*0.9 / (float)MAX(ana1len, ana2len)) - kTileMargin;
    //get the left margin for first tile
    float xOffset = (kScreenWidth - MAX(ana1len, ana2len) * (tileSide + kTileMargin))/2.0;
    
    //adjust for tile center (instead of the tile's origin)
    xOffset += tileSide/2;
    
    // initialize target list
    _targets = [NSMutableArray arrayWithCapacity:ana1len];
    
    //create targets
    for (int i=0; i<ana2len; i++) {
        NSString *letter = [anagram2 substringWithRange:NSMakeRange(i, 1)];
        
        if (![letter isEqualToString:@" "]) {
            TargetView *target = [[TargetView alloc] initWithLetter:letter andSideLength:tileSide];
            target.center = CGPointMake(xOffset + i*(tileSide + kTileMargin) +150, kScreenHeight/4);
            
            [self.gameView addSubview:target];
            [_targets addObject: target];
        }
    }
    
    //1 initialize tile list
    _tiles = [NSMutableArray arrayWithCapacity: ana1len];
    
    //2 create tiles
    for (int i=0;i<ana1len;i++) {
        NSString* letter = [anagram1 substringWithRange:NSMakeRange(i, 1)];
        
        //3
        if (![letter isEqualToString:@" "]) {
            TileView* tile = [[TileView alloc] initWithLetter:letter andSideLength:tileSide];
            tile.center = CGPointMake(xOffset + i*(tileSide + kTileMargin) +150 , kScreenHeight/2);
            [tile randomize];
            tile.dragDelegate = self;
            
            //4
            [self.gameView addSubview:tile];
            [_tiles addObject: tile];
        }
    }
}

//a tile was dragged, check if matches a target
- (void)tileView:(TileView *)tileView didDragToPoint:(CGPoint)pt{
    
    TargetView *targetView = nil;
    
    for (TargetView *tv in _targets) {
        if(CGRectContainsPoint(tv.frame, pt)){
            targetView = tv;
            break;
        }
    }
    
    //1 check if target was found
    if (targetView!=nil) {
        
        //2 check if letter matches
        if ([targetView.letter isEqualToString: tileView.letter]) {
            
            //3
            [self placeTile:tileView atTarget:targetView];
            
            //more stuff to do on success here
            
            [self checkForSuccess];
        } else {
            //You randomize the tile to demonstrate to the player that it does not match the target.
            //visualize the mistake
            [tileView randomize];
            
            //You create an animation that does some extra offsetting by a random value to the tile center’s x and y positions.

            [UIView animateWithDuration:0.35
                                  delay:0.00
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 tileView.center = CGPointMake(tileView.center.x + randomf(-20, 20),
                                                               tileView.center.y + randomf(20, 30));
                             } completion:nil];
            
        }
    }
}

-(void)placeTile:(TileView *)tileView atTarget:(TargetView *)targetView{
    targetView.isMatched = YES;
    tileView.isMatched = YES;
    
    //2 Disable user interactions for this tile. The user will not be able to move a tile once it’s been successfully placed.
    tileView.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.35
                          delay:0.00
                        options:UIViewAnimationOptionCurveEaseOut
     
                     animations:^{
                         tileView.center = targetView.center;
                         tileView.transform = CGAffineTransformIdentity;
                     }
     
                     completion:^(BOOL finished){
                         targetView.hidden = YES;
                     }];
    
}

- (void)checkForSuccess{
    for(TargetView* t in _targets){
        if (t.isMatched == NO) {
            return;
        }
    }
     NSLog(@"Game Over!");
}
@end




































