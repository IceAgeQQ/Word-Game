//
//  AudioController.h
//  Anagrams
//
//  Created by Chao Xu on 15/7/8.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioController : NSObject

-(void)playEffect:(NSString *)name;
-(void)preloadAudioEffects:(NSArray *)effectFileNames;
@end
