//
//  HighScoresViewController.h
//  SameGame
//
//  Created by Eno Compton on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HighScoresModel;

@interface HighScoresViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *returnToMenuButton;

@property (nonatomic, strong) IBOutletCollection(UILabel) NSMutableArray *playerNames;
@property (nonatomic, strong) IBOutletCollection(UILabel) NSMutableArray *playerScores;

@property (strong, nonatomic) HighScoresModel *highScores;

- (IBAction)returnToMenuPressed:(id)sender;

@end
