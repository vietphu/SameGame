//
//  EIVRootVC.h
//  SameGame
//
//  Created by Eno Compton on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BoardViewController;
@class HighScoresViewController;
@class SettingsViewController;

@interface RootViewController : UIViewController
{
    IBOutlet UIButton *playGameButton;
    IBOutlet UIButton *settingsButton;
    IBOutlet UIButton *highScoresButton;
}

@property (nonatomic, strong) BoardViewController *boardVC;
@property (nonatomic, strong) HighScoresViewController *highScoresVC;
@property (nonatomic, strong) SettingsViewController *settingsVC;

- (IBAction)playGamePressed:(id)sender;
- (IBAction)highScoresPressed:(id)sender;
- (IBAction)settingsPressed:(id)sender;

@end
