//
//  HighScoresViewController.m
//  SameGame
//
//  Created by Eno Compton on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HighScoresViewController.h"

@interface HighScoresViewController ()

@end

@implementation HighScoresViewController

@synthesize returnToMenuButton = _returnToMenuButton;
@synthesize playerNames = _playerNames;
@synthesize playerScores = _playerScores;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // check if HighScores.plist exists
        // create it, if it does not
        
        
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
    
    // save file
    
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

@end
