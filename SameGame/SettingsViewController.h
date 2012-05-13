//
//  SettingsViewController.h
//  SameGame
//
//  Created by Eno Compton on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
{
    IBOutlet UIButton *returnToMenuButton;
}

- (IBAction)returnToMenuPressed:(id)sender;

// add option to turn of new-level alerts

@end
