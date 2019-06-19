//
//  Game.m
//  shape videogame
//
//  Created by David Slakter on 2/14/14.
//  Copyright (c) 2014 David Slakter. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game
@synthesize player;

-(bool)prefersStatusBarHidden{
    return YES;
}
-(void)ObstacleMovement {
    if (Start == YES) {
        switch (levelNumber) {
            case 1: obstacleMoveDown = 1.9;
                
                if (Obstacle3.center.x > 283) {
                    obstacleSideMovement = - 1;
                }
                if (Obstacle3.center.x < 37) {
                    obstacleSideMovement = 1;
                }
                break;
            case 2: obstacleMoveDown = 2.2;
                if (Obstacle3.center.x > 283) {
                    obstacleSideMovement = - 1.4;
                }
                if (Obstacle3.center.x < 37) {
                    obstacleSideMovement = 1.4;
                }
                break;
            case 3:obstacleMoveDown = 2.5;
                if (Obstacle3.center.x > 283) {
                    obstacleSideMovement = - 2;
                }
                if (Obstacle3.center.x < 37) {
                    obstacleSideMovement = 2;
                }
                break;
            case 4: obstacleMoveDown = 2.8;
                if (Obstacle3.center.x > 283) {
                    obstacleSideMovement = - 2.1;
                }
                if (Obstacle3.center.x < 37) {
                    obstacleSideMovement = 2.1;
                }
                break;
            case 5: obstacleMoveDown = 3.1;
                    if (Obstacle3.center.x > 283) {
                        obstacleSideMovement = - 2.2;
                    }
                    if (Obstacle3.center.x < 37) {
                        obstacleSideMovement = 2.2;
                    }
                break;
            case 6: obstacleMoveDown = 3.5;
                        if (Obstacle3.center.x > 283) {
                            obstacleSideMovement = - 2.3;
                        }
                        if (Obstacle3.center.x < 37) {
                            obstacleSideMovement = 2.3;
                        }
                break;
            default:obstacleMoveDown = 1.9;
                
                if (Obstacle3.center.x > 283) {
                    obstacleSideMovement = - 1.2;
                }
                 if (Obstacle3.center.x < 37) {
                    obstacleSideMovement = 1.2;
                }
                
                break;
        }
        
         
        Obstacle1.center = CGPointMake(Obstacle1.center.x, Obstacle1.center.y + obstacleMoveDown); //move the obstacles down
        Obstacle2.center = CGPointMake(Obstacle2.center.x, Obstacle2.center.y + obstacleMoveDown);
        Obstacle3.center = CGPointMake(Obstacle3.center.x + obstacleSideMovement , Obstacle3.center.y + obstacleMoveDown);
        Obstacle4.center = CGPointMake(Obstacle4.center.x, Obstacle4.center.y + obstacleMoveDown);
        Obstacle5.center = CGPointMake(Obstacle5.center.x, Obstacle5.center.y + obstacleMoveDown);
        Obstacle6.center = CGPointMake(Obstacle6.center.x, Obstacle6.center.y + obstacleMoveDown);
        Obstacle7.center = CGPointMake(Obstacle7.center.x, Obstacle7.center.y + obstacleMoveDown);
                
        
        if (Obstacle1.center.y > 640) {
            RandomPosition = arc4random() %274;
            RandomPosition = RandomPosition + 20;
            Obstacle1.center = CGPointMake(RandomPosition, -700);
        }
        if (Obstacle2.center.y > 640) {
            RandomPosition = arc4random() %338;
            RandomPosition = RandomPosition + 30;
            Obstacle2.center = CGPointMake(RandomPosition, -700);
        }
        if (Obstacle3.center.y > 640) {
            RandomPosition = arc4random() %245;
            RandomPosition = RandomPosition + 38;
            Obstacle3.center = CGPointMake(RandomPosition, -700);
            
        }
        if (Obstacle4.center.y > 640) {
            RandomPosition = arc4random() %245;
            RandomPosition = RandomPosition + 38;
            Obstacle4.center = CGPointMake(RandomPosition, -700);
            
        }
        if (Obstacle5.center.y > 640) {
            RandomPosition = arc4random() %245;
            RandomPosition = RandomPosition + 38;
            Obstacle5.center = CGPointMake(RandomPosition, -700);
        }
        if (Obstacle6.center.y > 640) {
            RandomPosition = arc4random() %55;
            Obstacle6.center = CGPointMake(RandomPosition, -700);
            RandomPosition = RandomPosition +290;
            Obstacle7.center = CGPointMake(RandomPosition, -700);
        }

       }
}



-(void)scoring {
    scoreNumber = scoreNumber + 1;
    Score.text = [NSString stringWithFormat:@"%i", scoreNumber];
    if (scoreNumber >= 0) {
        levelNumber = 1;
    }
    if (scoreNumber > 15 && scoreNumber <= 30) {
        levelNumber = 2;
    }
    if (scoreNumber > 30 && scoreNumber <= 45) {
        levelNumber = 3;
    }
    if (scoreNumber > 45 && scoreNumber <= 65) {
        levelNumber = 4;
    }
    if (scoreNumber > 65 && scoreNumber <= 100) {
        levelNumber = 5;
    }
    if (scoreNumber > 100) {
        levelNumber = 6;
    }
}

-(void)Collision {
   
    if (CGRectIntersectsRect(triangle.frame, Obstacle1.frame)){
        [self endGame];
        
        Pause.hidden = YES;
    }
    if (CGRectIntersectsRect(triangle.frame, Obstacle2.frame)){
        [self endGame];
        
        Pause.hidden = YES;
        Resume.hidden = YES;
    }
    if (CGRectIntersectsRect(triangle.frame, Obstacle3.frame)){
        [self endGame];
        
        Pause.hidden = YES;
        Resume.hidden = YES;
    }
    if (CGRectIntersectsRect(triangle.frame, Obstacle4.frame)){
        [self endGame];
        
        Pause.hidden = YES;
        Resume.hidden = YES;
    }
    if (CGRectIntersectsRect(triangle.frame, Obstacle5.frame)){
        [self endGame];
        
        Pause.hidden = YES;
        Resume.hidden = YES;
    }
    if (CGRectIntersectsRect(triangle.frame, Obstacle6.frame)) {
        [self endGame];
        
        Pause.hidden = YES;
        Resume.hidden = YES;
    }
    if (CGRectIntersectsRect(triangle.frame, Obstacle7.frame)) {
        [self endGame];
        
        Pause.hidden = YES;
        Resume.hidden = YES;
    }


  
}


-(IBAction)replay:(id)sender{
    [self NewGame];
}

-(void)NewGame{
    Obstacle1.hidden = YES;
    Obstacle2.hidden = YES;
    Obstacle3.hidden = YES;
    Obstacle4.hidden = YES;
    Obstacle5.hidden = YES;
    Obstacle6.hidden = YES;
    Obstacle7.hidden = YES;
    triangle.hidden = NO;
    Resume.hidden = YES;
   
    int RandomNumber;
    RandomNumber = arc4random() %4;
    switch (RandomNumber) {
        case 0:
            triangle.image = [UIImage imageNamed:@"Game_plane.png"];
            break;
        case 1:
            triangle.image = [UIImage imageNamed:@"PlaneImage2.png"];
            break;
        case 2:
            triangle.image = [UIImage imageNamed:@"PlaneImage4.png"];
            break;
        case 3:
            triangle.image = [UIImage imageNamed:@"PlaneImage3.png"];
            break;
        default:
            triangle.image = [UIImage imageNamed:@"Game_plane.png"];
            break;
    }  
start.hidden = NO;
    menu.hidden = YES;
    highScoreLabel.hidden = YES;
    replay.hidden = YES;
    Start = YES;
    scoreNumber = 0;
    Score.text = [ NSString stringWithFormat:@"0"];
    triangle.center = CGPointMake(160, triangle.center.y);
}

-(void)endGame {
    menu.hidden = NO;
    replay.hidden = NO;
    Start = NO;
    [timer invalidate];
    [scorer invalidate];
    if (scoreNumber > highScore) {
        highScore = scoreNumber;
        [[NSUserDefaults standardUserDefaults] setInteger:highScore forKey:@"HighScoreSaved"];
        highScoreLabel.hidden = NO;
    }
    [player stop];
    triangle.image = [UIImage imageNamed:@"Plane crash3.png"];
    NSURL *PlaneURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"planeCrashSound" ofType:@"mp3"]];
    PlaneCrash = [[AVAudioPlayer alloc] initWithContentsOfURL:PlaneURL error:nil];
    PlaneCrash.volume = 0.55;
    PlaneCrash.numberOfLoops = 0;
    [PlaneCrash play];
}




-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    TriangleLeft = NO; //stop triangle when touches ended.
    TriangleRight = NO;
    StopSideMovement = YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  
    if (Start == YES) {
        
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (point.x < 160) { //if user touches left side of the screen, move triangle left.
        TriangleLeft = YES;
    }
    else{ //otherwise, move triangle right.
        TriangleRight = YES;
    }
    }
}
    
 
-(void)PlaneMove {
    [self  ObstacleMovement];
    [self Collision];

    if (Start == YES) {
        
    
    triangle.center = CGPointMake(triangle.center.x - sideMovement, triangle.center.y); //move plane left or right.
    if (TriangleLeft == YES) {
        sideMovement = 4;
    }
    if (TriangleRight == YES) {
        sideMovement = -4;
    }
    if (StopSideMovement == YES) {
        sideMovement = 0;
        if (sideMovement == 0) {
            StopSideMovement = NO;
        }
    }
    
    if (triangle.center.x > 333) {
        triangle.center = CGPointMake(-3, triangle.center.y); //regenerate plane on opposite side of the screen.
    }
    if (triangle.center.x < -3) {
        triangle.center = CGPointMake(321, triangle.center.y);
    }
    }
       }

-(IBAction)start:(id)sender{
    if (Start == YES) {
        Obstacle1.center = CGPointMake(306,-150);
        Obstacle2.center = CGPointMake(80,-400);
        Obstacle3.center = CGPointMake(-2,-600);
        Obstacle4.center = CGPointMake(38, -800);
        Obstacle5.center = CGPointMake(110, -1000);
        Obstacle6.center = CGPointMake(6, -1200);
        Obstacle7.center = CGPointMake(306, -1200);
       
        Start = YES;
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(PlaneMove) userInfo:nil repeats:YES];
        scorer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(scoring) userInfo:nil repeats:YES];
        Obstacle1.hidden = NO;
        Obstacle2.hidden = NO;
        Obstacle3.hidden = NO;
        Obstacle4.hidden = NO;
        Obstacle5.hidden = NO;
        Obstacle6.hidden = NO;
        Obstacle7.hidden = NO;
        Pause.hidden = NO;
        
      
        menu.hidden = YES;
        replay.hidden = YES;
        start.hidden = YES;
        obstacleSideMovement = 5;
        NSURL *songURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"planeEngineSound" ofType:@"mp3"]];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:songURL error:nil];
        player.volume = 0.15;
        player.numberOfLoops = -1;
        [player play];
      }
    }
-(IBAction)Pause:(id)sender{
    [timer invalidate];
    [player pause];
    [scorer invalidate];
    Resume.hidden = NO;
}


-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
    
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

    
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad

{
    Resume.hidden = YES;
    scoreNumber = 0;
    Obstacle1.hidden = YES;
    Obstacle2.hidden = YES;
    Obstacle3.hidden = YES;
    Obstacle4.hidden = YES;
    Obstacle5.hidden = YES;
    Obstacle6.hidden = YES;
    Obstacle7.hidden = YES;
    menu.hidden = YES;
    replay.hidden = YES;
    highScoreLabel.hidden = YES;
    Start = YES;
    highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    Pause.hidden = YES;
  
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    int RandomNumber;
    RandomNumber = arc4random() %4;
    
    switch (RandomNumber) {
        case 0:
            triangle.image = [UIImage imageNamed:@"Game_plane.png"];
            break;
            case 1:
            triangle.image = [UIImage imageNamed:@"PlaneImage2.png"];
            break;
            case 2:
            triangle.image = [UIImage imageNamed:@"PlaneImage4.png"];
            break;
        case 3:
            triangle.image = [UIImage imageNamed:@"PlaneImage3.png"];
            break;
        default:
            triangle.image = [UIImage imageNamed:@"Game_plane.png"];
            break;
    }
  
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)Resume:(id)sender {
    Resume.hidden = YES;
    [player play];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(PlaneMove) userInfo:nil repeats:YES];
    scorer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(scoring) userInfo:nil repeats:YES];

}


@end
