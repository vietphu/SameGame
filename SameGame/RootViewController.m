//
//  EIVRootVC.m
//  SameGame
//
//  Created by Eno Compton on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "BoardViewController.h"
#import "HighScoresViewController.h"
#import "SettingsViewController.h"

@implementation RootViewController

@synthesize playGameButton = _playGameButton;
@synthesize settingsButton = _settingsButton;
@synthesize highScoresButton = _highScoresButton;

@synthesize boardVC = _boardVC;
@synthesize highScoresVC = _highScoresVC;
@synthesize settingsVC = _settingsVC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    }
    
    return self;
}

- (id)init
{
    return [self initWithNibName:@"RootVC" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad called");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.boardVC = nil;
    self.highScoresButton = nil;
    self.settingsVC = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)playGamePressed:(id)sender
{
    NSLog(@"playGamePressed");
    self.boardVC = [[BoardViewController alloc] init];
    [self.view insertSubview:self.boardVC.view aboveSubview:self.view];
}

- (void)highScoresPressed:(id)sender
{
    NSLog(@"highScoresPressed");
    self.highScoresVC = [[HighScoresViewController alloc] init];
    [self.view insertSubview:self.highScoresVC.view aboveSubview:self.view];
}

- (void)settingsPressed:(id)sender
{
    NSLog(@"settingsPressed");
    self.settingsVC = [[SettingsViewController alloc] init];
    [self.view insertSubview:self.settingsVC.view aboveSubview:self.view];
}

@end
