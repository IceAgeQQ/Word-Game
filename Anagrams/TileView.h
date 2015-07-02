//
//  TileView.h
//  Anagrams
//
//  Created by Chao Xu on 15/6/30.
//  Copyright (c) 2015年 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TileView;
@protocol TileDraDelegateProtocol <NSObject>
- (void)tileView:(TileView *)tileView didDragToPoint:(CGPoint)pt;
@end

@interface TileView : UIImageView
@property (weak, nonatomic)id<TileDraDelegateProtocol> dragDelegate;
@property (strong, nonatomic, readonly)NSString *letter;
@property (assign, nonatomic) BOOL isMatched;

-(instancetype)initWithLetter:(NSString *)letter andSideLength:(float)sideLength;
-(void)randomize;
@end
