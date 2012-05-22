//
//  HighScoresViewController.h
//  SameGame
//
//  Created by Eno Compton on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScoresViewController : UIViewController
{
    IBOutlet UIButton *returnToMenuButton;
}

@property (nonatomic, strong) IBOutlet UILabel *score0;
@property (nonatomic, strong) IBOutlet UILabel *score1;
@property (nonatomic, strong) IBOutlet UILabel *score2;
@property (nonatomic, strong) IBOutlet UILabel *score3;
@property (nonatomic, strong) IBOutlet UILabel *score4;

@property (nonatomic, strong) IBOutlet UILabel *score5;
@property (nonatomic, strong) IBOutlet UILabel *score6;
@property (nonatomic, strong) IBOutlet UILabel *score7;
@property (nonatomic, strong) IBOutlet UILabel *score8;
@property (nonatomic, strong) IBOutlet UILabel *score9;

- (IBAction)returnToMenuPressed:(id)sender;

@end
