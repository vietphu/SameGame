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
@synthesize score0 = _score0;
@synthesize score1 = _score1;
@synthesize score2 = _score2;
@synthesize score3 = _score3;
@synthesize score4 = _score4;
@synthesize score5 = _score5;
@synthesize score6 = _score6;
@synthesize score7 = _score7;
@synthesize score8 = _score8;
@synthesize score9 = _score9;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

@end
