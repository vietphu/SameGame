//
//  HighScoresViewController.m
//  SameGame
//
//  Created by Eno Compton on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HighScoresViewController.h"
#import "HighScoresProtocol.h"

@interface HighScoresViewController ()

@end

@implementation HighScoresViewController

@synthesize returnToMenuButton = _returnToMenuButton;
@synthesize playerNames = _playerNames;
@synthesize playerScores = _playerScores;

@synthesize highScores = _highScores;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
 
//        have to initialize highScores in AppDelegete before assigning the value here.
//        self.highScores = [self highScores];
        
    }
    
    return self;
}

- (id)init
{
    return [self initWithNibName:@"HighScoresVC" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // read from file
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)returnToMenuPressed:(id)sender
{
    NSLog(@"returnToMenuPressed");
    [self.view removeFromSuperview];
}

- (HighScoresModel *)highScores
{
    id<HighScoresProtocol> appDelegate = (id<HighScoresProtocol>)[UIApplication sharedApplication].delegate;
    return (HighScoresModel *)appDelegate.highScores;
}

@end
