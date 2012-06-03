//
//  EIVBoardVC.m
//  SameGame
//
//  Created by Eno Compton on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardViewController.h"
#import "BoardModel.h"
#import "SameGameBlock.h"
#import "UIColor+RandomColor.h"
#import "HighScoresModel.h"
#import "HighScoresProtocol.h"

@implementation BoardViewController

@synthesize board = _board;

@synthesize lifeCounter = _lifeCounter;
@synthesize levelCounter = _levelCounter;
@synthesize blocksCounter = _blocksRemoved;
@synthesize scoreCounter = _scoreCounter;

@synthesize observableValues = _observableValues;

#pragma mark - Initialization
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.board = [[BoardModel alloc] init];
        
        // Add key-value observing
        self.observableValues = [[NSArray alloc] initWithObjects:@"levelOver", @"levelNum",
                                 @"livesRemaining", @"blocksRemoved", @"currentScore", nil];
        for (NSString *keyValue in self.observableValues) {
            [self.board addObserver:self
                         forKeyPath:keyValue
                            options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew)
                            context:NULL];
        }
    }
    return self;
}

- (id)init
{
    return [self initWithNibName:@"BoardVC" bundle:nil];
}

#pragma mark - View Loading and Unloading
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addBlocksAndLivesToView];
    
    NSString *blocksRemoved = [NSString stringWithFormat:@"%d", self.board.blocksRemoved];
    [self.blocksCounter setText:blocksRemoved];
    
    NSString *livesRemaining = [NSString stringWithFormat:@"%d", self.board.livesRemaining];
    [self.lifeCounter setText:livesRemaining];
    
    NSString *levelCounter = [NSString stringWithFormat:@"%d", self.board.levelNum];
    [self.levelCounter setText:levelCounter];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view
    self.board = nil;
    self.lifeCounter = nil;
    self.blocksCounter = nil;
    self.observableValues = nil;
    self.scoreCounter = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)addBlocksAndLivesToView
{
    for (int col = 0; col < NUMBER_OF_COLUMNS; col++) {
        for (int row = 0; row < NUMBER_OF_ROWS; row++) {
            SameGameBlock *block = [self.board blockAtColumn:col andRow:row];
            [self.view addSubview:block];
        }
    }
}

#pragma mark - UIAlertViewDelegate Methods
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag) {
        
        case EXIT_GAME: // Exit Game to Main Menu
            if (buttonIndex == 1) {
                [self exitToMainScreen];
            }
            break;
        
        case RESET_GAME: // Reset Game
            if (buttonIndex == 1) {
                [self resetGame];
            }
            break;
        
        case HIGH_SCORE: // New High Score!
            [self saveHighScore:[alertView textFieldAtIndex:buttonIndex].text];
            break;
        
        case GAME_OVER: // Game over
            if (buttonIndex == 0) {
                [self exitToMainScreen];
            }
            else {
                [self resetGame];
            }
            break;
            
        default: // NEXT_LEVEL
            [self newLevel];
            break;
    }
}

#pragma mark - Buttons Pressed
- (void)mainScreenPressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Exit Game to Main Menu" 
                                                    message:@"Are you sure?"
                                                   delegate:self 
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Main menu", nil];
    alert.tag = EXIT_GAME;
    [alert show];
}

- (void)exitToMainScreen
{
    // remove self as KVO delegate
    for (NSString *keyValue in self.observableValues) {
        [self.board removeObserver:self forKeyPath:keyValue];
    }
    
    // remove board view from view
    [self.view removeFromSuperview];
}

- (void)resetGamePressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reset Game"
                                                    message:@"Are you sure?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Reset Game", nil];
    alert.tag = RESET_GAME;
    [alert show];
}

- (void)resetGame
{
    [self newLevel];
    self.board.livesRemaining = 10;
    self.board.blocksRemoved = 0;
    self.board.levelNum = 1;
    self.board.currentScore = 0;
}

- (void)newLevel
{
    for (int col = 0; col < NUMBER_OF_COLUMNS; col++) {
        for (int row = 0; row < NUMBER_OF_ROWS; row++) {
            SameGameBlock *block = [self.board blockAtColumn:col andRow:row];
            UIColor *color = [UIColor randomColor];
            [block initializeBlock:color];
            [block setNeedsDisplay];
        }
    }
    
    self.board.blocksRemaining = NUMBER_OF_COLUMNS * NUMBER_OF_ROWS;
    self.board.levelOver = NO;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object 
                        change:(NSDictionary *)change context:(void *)context
{
    if (keyPath == @"levelOver" && self.board.levelOver) {
        [self handleLevelOver];
    }
    
    if (keyPath == @"livesRemaining") {
        NSString *livesRemaining = [NSString stringWithFormat:@"%d", self.board.livesRemaining];
        [self.lifeCounter setText:livesRemaining];
    }
    
    if (keyPath == @"blocksRemoved") {
        NSString *blocksRemoved = [NSString stringWithFormat:@"%d", self.board.blocksRemoved];
        [self.blocksCounter setText:blocksRemoved];
    }
    
    if (keyPath == @"levelNum") {
        NSString *levelNumber = [NSString stringWithFormat:@"%d", self.board.levelNum];
        [self.levelCounter setText:levelNumber];
    }
    
    if (keyPath == @"currentScore") {
        NSString *score = [NSString stringWithFormat:@"%d", self.board.currentScore];
        [self.scoreCounter setText:score];
    }
}

#pragma mark - Level and Game Over
- (void)handleLevelOver
{
    if ([self.board isGameOver]) {
        [self handleGameOver];
    }
    
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Next Level!!!" 
                                                        message:@"NICE!"
                                                       delegate:self
                                              cancelButtonTitle:@"Let's go!"
                                              otherButtonTitles:nil];
        alert.tag = NEXT_LEVEL;
        [alert show];
    }
}

- (void)handleGameOver
{
    if ([self isHighScore]) {
        UIAlertView *highScoreAlert = [[UIAlertView alloc] initWithTitle:@"New High Score!" 
                                                                 message:@"Enter Player's Name"
                                                                delegate:self 
                                                       cancelButtonTitle:@"Save Score!"
                                                       otherButtonTitles:nil];
        highScoreAlert.tag = HIGH_SCORE;
        // add text field to alert
        [highScoreAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
        
        // set self as delegate to receive textFieldDidEndEditing to capture player's name
        UITextField *alertTextField = [highScoreAlert textFieldAtIndex:0];
        alertTextField.delegate = self;
        alertTextField.returnKeyType = UIReturnKeyDone;
        
        [highScoreAlert show];
    }
    
    else {
        // Create game over alert and assign self as delegate to capture user input
        UIAlertView *gameOverAlert = [[UIAlertView alloc] initWithTitle:@"Game Over!" 
                                                                message:@"Try again!" 
                                                               delegate:self 
                                                      cancelButtonTitle:@"Main Menu" 
                                                      otherButtonTitles:@"Reset Game", nil];
        gameOverAlert.tag = GAME_OVER;
        [gameOverAlert show];
    }
}

#pragma mark - UITextFieldDelegate Methods
// this limits the length of text entry in the alertTextField
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string 
{
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    return newLength <= MAX_PLAYER_NAME_LENGTH;
}

#pragma mark - High Scores
- (BOOL)isHighScore
{
    // add high score test here.
    return FALSE;
}

- (void)saveHighScore:(NSString *)playerName
{
    // add currentScore to a Score object and store in HighScoresModel
    NSLog(@"Will save player: %@ with score: %d", playerName, self.board.currentScore);
}

- (HighScoresModel *)highScores
{
    id<HighScoresProtocol> appDelegate = (id<HighScoresProtocol>)[UIApplication sharedApplication].delegate;
    return (HighScoresModel *)appDelegate.highScores;
}

@end
