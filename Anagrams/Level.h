//
//  Level.h
//  Anagrams
//
//  Created by Chao Xu on 15/6/30.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
//properties stored in a .plist file
@interface Level : NSObject
@property (assign, nonatomic) int pointsPerTile;
@property (assign, nonatomic) int timeToSolve;
@property (strong, nonatomic) NSArray *anagrams;

//factory method to load a .plist file and initialize the model
+(instancetype)levelWithNum:(int)levelNum;
@end
