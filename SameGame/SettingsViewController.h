//
//  SettingsViewController.h
//  SameGame
//
//  Created by Eno Compton on 4/14/12.


#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *returnToMenuButton;

- (IBAction)returnToMenuPressed:(id)sender;

// add option to turn of new-level alerts

@end
