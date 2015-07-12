//
//  ViewController.m
//  Anagrams
//
//  Created by Marin Todorov on 16/02/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "config.h"
#import "ViewController.h"
#import "Level.h"
#import "GameController.h"
#import "HUDView.h"

@interface ViewController () <UIActionSheetDelegate>
@property (strong, nonatomic) GameController *controller;
@end

@implementation ViewController

//setup the view and instantiate the game controller
- (void)viewDidLoad
{
    [super viewDidLoad];
  //  Level *level1 = [Level levelWithNum:1];
  //  NSLog(@"anagrams: %@", level1.anagrams);
    
    UIView *gameLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:gameLayer];
    self.controller.gameView = gameLayer;
    
    //add one layer for all hud and controls
    HUDView* hudView = [HUDView viewWithRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:hudView];
    self.controller.hud = hudView;
    
    __weak ViewController *weakSelf = self;
    self.controller.onAnagramSolved = ^(){
        [weakSelf showLevelMenu];
    };
    
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self != nil) {
        self.controller = [[GameController alloc] init];
    }
    return self;
}

//show the level selector menu
- (void)showLevelMenu{
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"Play @ difficulty level" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Easy",@"Challenge",@"Hard-Core", nil];
    [action showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    //It checks if the passed buttonIndex equals -1. If so, that means the player tapped outside the menu, in which case, just show the menu again.
    if (buttonIndex==-1) {
        [self showLevelMenu];
        return;
    }
    int levelNum = buttonIndex+1;
    
    //3 load the level, fire up the game
    self.controller.level = [Level levelWithNum:levelNum];
    [self.controller dealRandomAnagram];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self showLevelMenu];
}

@end
































