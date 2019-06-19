//
//  Game.h
//  shape videogame
//
//  Created by David Slakter on 2/14/14.
//  Copyright (c) 2014 David Slakter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <iAd/iAd.h>

float obstacleMoveDown;
int levelNumber;
float obstacleSideMovement;
int scoreNumber;
int highScore;
int RandomPosition;
int sideMovement;
BOOL Start;
BOOL TriangleLeft;
BOOL TriangleRight;
BOOL StopSideMovement;

@interface Game : UIViewController
{
    AVAudioPlayer *player;
    AVAudioPlayer *PlaneCrash;
    IBOutlet UIImageView *triangle;
    IBOutlet UIImageView *Obstacle1;
    IBOutlet UIImageView *Obstacle2;
    IBOutlet UIImageView *Obstacle3;
    IBOutlet UIImageView *Obstacle4;
    IBOutlet UIImageView *Obstacle5;
    IBOutlet UIImageView *Obstacle6;
    IBOutlet UIImageView *Obstacle7;
    
    
    IBOutlet UILabel *Score;
    IBOutlet UIButton *start;
    IBOutlet UIButton *menu;
    IBOutlet UIButton *replay;
    IBOutlet UIButton *Pause;
    IBOutlet UIButton *Resume;
    IBOutlet UILabel *highScoreLabel;
    NSTimer *timer;
    NSTimer *scorer;
 }
-(void)scoring;
-(IBAction)start:(id)sender;
-(IBAction)Pause:(id)sender;
-(IBAction)Resume:(id)sender;
-(void)PlaneMove;
-(void)endGame;
-(void)NewGame;
-(void)Collision;
-(void)ObstacleMovement;
@property (nonatomic, retain) AVAudioPlayer *player;

@end
