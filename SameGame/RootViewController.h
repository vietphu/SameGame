//
//  EIVRootVC.h
//  SameGame
//
//  Created by Eno Compton on 3/24/12.


#import <UIKit/UIKit.h>

@class BoardViewController;
@class HighScoresViewController;
@class SettingsViewController;

@interface RootViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *playGameButton;
@property (nonatomic, strong) IBOutlet UIButton *settingsButton;
@property (nonatomic, strong) IBOutlet UIButton *highScoresButton;

@property (nonatomic, strong) BoardViewController *boardVC;
@property (nonatomic, strong) HighScoresViewController *highScoresVC;
@property (nonatomic, strong) SettingsViewController *settingsVC;

- (IBAction)playGamePressed:(id)sender;
- (IBAction)highScoresPressed:(id)sender;
- (IBAction)settingsPressed:(id)sender;

@end
