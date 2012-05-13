//
//  EIVBoardVC.h
//  SameGame
//
//  Created by Eno Compton on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BoardModel;
@class Score;

@interface BoardViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) BoardModel *board;
@property (strong, nonatomic) IBOutlet UIButton *mainScreenButton;
@property (strong, nonatomic) IBOutlet UIButton *resetGameButton;

@property (strong, nonatomic) IBOutlet UILabel *lifeCounter;
@property (strong, nonatomic) IBOutlet UILabel *blocksCounter;
@property (strong, nonatomic) IBOutlet UILabel *levelCounter;
@property (strong, nonatomic) IBOutlet UILabel *scoreCounter;

@property (strong, nonatomic) NSArray *observableValues;

- (IBAction)mainScreenPressed:(id)sender;
- (void)exitToMainScreen;
- (void)confirmExitToMainScreen;
- (IBAction)resetGamePressed:(id)sender;
- (void)resetGame;
- (void)confirmResetGame;


- (void)addBlocksAndLivesToView;

- (void)handleLevelOver;
- (void)handleGameOver;
- (void)newLevel;

- (BOOL)isHighScore;
- (void)saveHighScore:(Score *)newHighScore;

@end
