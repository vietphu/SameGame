//
//  HighScoresModel.m
//  SameGame
//
//  Created by Eno Compton on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HighScoresModel.h"
#import "Score.h"

@implementation HighScoresModel

@synthesize topTenScores = _topTenScores;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.topTenScores = [[NSMutableArray alloc] init];
        
        // read from file here adding names and scores
        // and "No name" and "No score" or some such to empty values
    }
    
    return self;
}

- (void)dealloc
{
    self.topTenScores = nil;
}

- (void)addToTopTenScores:(Score *)newScore
{
    
}


@end
