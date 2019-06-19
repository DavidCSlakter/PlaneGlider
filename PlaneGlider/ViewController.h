//
//  ViewController.h
//  shape shifter
//
//  Created by David Slakter on 2/16/14.
//  Copyright (c) 2014 David Slakter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
int highScoreNumber;
@interface ViewController : UIViewController <ADBannerViewDelegate> {
    IBOutlet UIButton *Start;
    IBOutlet UILabel *HighScore;
  
   
    
   }


@end
